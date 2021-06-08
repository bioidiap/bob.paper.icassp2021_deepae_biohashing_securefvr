RESULT_DIR=../../models

# Normal Scenario
all_labels=AE+Biohash[proposed],WLD+Biohash,MC+Biohash,RLT+Biohash,WLD,MC,RLT

bob bio metrics  $RESULT_DIR/{img/verify/results/img-AE-BHsh-100,wld/results/wld-BHsh-100,mc/results/mc-BHsh-100,rlt/results/rlt-BHsh-100,wld/results/wld,mc/results/mc,rlt/results/rlt}/baseline/nom/nonorm/scores-{dev,eval} -l metrics_normal.txt

bob bio roc -e -v $RESULT_DIR/{img/verify/results/img-AE-BHsh-100,wld/results/wld-BHsh-100,mc/results/mc-BHsh-100,rlt/results/rlt-BHsh-100,wld/results/wld,mc/results/mc,rlt/results/rlt}/baseline/nom/nonorm/scores-{dev,eval} -lg $all_labels -o ROC_normal.pdf --figsize 6,4


# Stolen Token Scenario
all_labels=AE+Biohash[proposed],WLD+Biohash,MC+Biohash,RLT+Biohash

bob bio metrics  $RESULT_DIR/{img/verify/results/img-AE-BHsh-100,wld/results/wld-BHsh-100,mc/results/mc-BHsh-100,rlt/results/rlt-BHsh-100}-stolen/baseline/nom/nonorm/scores-{dev,eval} -l metrics_stolen.txt

bob bio roc -e -v $RESULT_DIR/{img/verify/results/img-AE-BHsh-100,wld/results/wld-BHsh-100,mc/results/mc-BHsh-100,rlt/results/rlt-BHsh-100}-stolen/baseline/nom/nonorm/scores-{dev,eval} -lg $all_labels -o ROC_stolen.pdf --figsize 6,4