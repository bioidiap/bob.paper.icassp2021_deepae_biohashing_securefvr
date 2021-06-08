# Deep Auto-Encoding and Biohashing for Secure Finger Vein Recognition

This package is part of the signal-processing and machine learning toolbox
[Bob](https://www.idiap.ch/software/bob). It contains the source code to reproduce the following paper:

```
@inproceedings{ICASSP2021_DAE_SecureFVR,
  title={Deep Auto-Encoding and Biohashing for Secure Finger Vein Recognition},
  author={Shahreza, Hatef Otroshi and Marcel, S{\'e}bastien},
  booktitle={ICASSP 2021-2021 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)},
  pages={2585--2589},
  year={2021},
  organization={IEEE}
}
```

If you use this package and/or its results, please cite both the package and [the corresponding paper](https://ieeexplore.ieee.org/abstract/document/9414498).  Also, please ensure that you include the two original Bob references in your citations.

**NOTE:** 
In the instructions that follow, the use of `< ... >` inside file paths indicates that you must replace the part enclosed within `<` and `>` with the appropriate value.  For example `<path_to_your_working_directory>` indicates that you should replace this part with the full path to the directory inside which you are running this code.  



## Installation

The experiments can only be executed on a Linux 64-bit machine.
Install [conda](https://conda.io) and run the steps below::
```
   $ git clone https://gitlab.idiap.ch/bob/bob.paper.icassp2021_deepae_biohashing_securefvr.git
   $ cd bob.paper.icassp2021_deepae_biohashing_securefvr
   $ conda create -n ICASSP2021_DAE_SecureFVR --file package-list.txt
   $ conda activate ICASSP2021_DAE_SecureFVR
```

## Downloading the Databases

The next thing you must do is to download the UTFVP fingervein database used in our experiments.  Please refer to the following website to do this: 

Take note of the directory in which you have stored the downloaded database.  Then, create a textfile named ``.bob_bio_databases.txt`` and **store it in your home directory.**  Inside this textfile, insert the following line:

```
   [YOUR_UTFVP_DIRECTORY] = <path_to_utfvp_database>
```

Make sure you replace `<path_to_utfvp_database>` with the path to your downloaded UTFVP database.



## Running the Experiments
You are now ready to run the experiments to reproduce the results in the paper.  To do this, follow steps 1-5:

### Step 1: Preparing data for training (Data Augmentation)
In order to prepare the data for training the neural network you need to run `data.py` in `data` directory:
```
$ cd data
$ python data.py
```

**NOTE:** In `data` directory, there are two Jupyter notebooks to work more with the dataset:
- `Data-Augmentation.ipynb`: This notebook contains the code for data augmentation as well as code for visualization of augemnted data.
- `Sample_Image.ipynb`: This notebook contains the code to generate images used in figure 1 of the paper.

### Step 2: Training Deep Auto-Encoder
Now that the data is ready, we can train our DNN. For this end, run the following code:
```
$ cd models/img
$ python train.py
```

### Step 3: Executing different finger vein recognition methods
We can execute different finger vein recognition methods including WLD, WLD+Biohash, MC, MC+Biohash, RLT, RLT+Biohash and our trained AE+Biohash [the proposed method] by runnung the following script:
```
$ execute_fvr.sh
```

### Step 4: Generating Figure 3 and Table 1
In order to evaluate and compare the FVR models, you can run the following script:
```
$ cd evaluation/compare_methods
$ ./eval.sh
```
This generates two `.pdf` files and two `.txt` files which are used in Figure 3 and Table 1, respectively.

### Step 6: Generating Table 2
In order to evaluate and compare the execution time of different FVR models as presented in Table 2 of the paper, you can use the Jupyter notebooks in `evaluation/time` directory.


## Contact

For questions or reporting issues to this software package, contact our
development [mailing list](https://www.idiap.ch/software/bob/discuss).