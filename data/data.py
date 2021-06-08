## Load data
print("start the code")
import numpy as np
from bob.bio.vein.configurations.utfvp import database
import bob.io.base

from bob.bio.vein.preprocessor import NoCrop, TomesLeeMask, HuangNormalization, \
    NoFilter, Preprocessor

preprocessor = Preprocessor(
    crop=NoCrop(),
    mask=TomesLeeMask(),
    normalize=HuangNormalization(),
    filter=NoFilter(),
    )

all_Files = database.objects(protocol='nom', groups='world')
    
all_imgs=[]
all_client_ids=[]
print("preparing data")

from tqdm import tqdm 
for obj in tqdm(all_Files):
    path=obj.make_path('<path_to_utfvp_database>','.png')
    image = bob.io.base.load(path)
    image_and_mask = preprocessor(image)
    
    all_imgs.append(image)
    all_client_ids.append(obj.client_id)

all_imgs  = np.array(all_imgs)/255.0

######################################################################    
## Data Augmentation
from tensorflow.keras.preprocessing.image import ImageDataGenerator

datagen = ImageDataGenerator(rotation_range=7,
                             width_shift_range=0.025,
                             height_shift_range=0.025,
                             channel_shift_range=0.075,
                             zoom_range=(0.95,1.05)
                             )

all_imgs = np.reshape(all_imgs, [all_imgs.shape[0], all_imgs.shape[1], all_imgs.shape[2], 1])
all_imgs_aug       = np.copy(all_imgs)
all_client_ids_aug = all_client_ids.copy()

itr=0
for gen_imgs, gen_lables in datagen.flow(all_imgs, 
                                         all_client_ids,
                                         batch_size = all_imgs.shape[0],
                                         seed=itr
                                        ):
    itr += 1
    print(itr, all_imgs_aug.shape[0])
    all_imgs_aug = np.append(all_imgs_aug, 
                             gen_imgs,
                             axis=0)
    for ID in gen_lables:
        all_client_ids_aug.append(ID)
    
    if itr==19:
        break
print("Total Aug images:", all_imgs_aug.shape[0])


np.save('all_imgs_aug.npy', all_imgs_aug) 

import pickle
with open('all_client_ids_aug.pkl','wb') as f:
    pickle.dump(all_client_ids_aug,f)