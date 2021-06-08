cd models/wld
verify.py wld.py -vvv
verify.py wld-BHsh-100.py -vvv
verify.py wld-BHsh-100-stolen.py -vvv

cd ../../models/mc
verify.py mc.py -vvv
verify.py mc-BHsh-100.py -vvv
verify.py mc-BHsh-100-stolen.py -vvv

cd ../../models/rlt
verify.py rlt.py -vvv
verify.py rlt-BHsh-100.py -vvv
verify.py rlt-BHsh-100-stolen.py -vvv

cd ../../models/img/verify/
verify.py img-BHsh-100.py -vvv
verify.py img-BHsh-100-stolen.py -vvv