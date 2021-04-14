#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
NUM_START=$3
NUM_END=$4

for ((i=NUM_START; i<=NUM_END; i++)); do
    f=$DIR_MODEL/logp04/model.iter-$i
    if [ -e $f ]; then
        echo $f
        python decode_validation.py --test ../data/logp04/valid.txt --vocab ../data/logp04/vocab.txt --model $f --hidden_size 300 --rand_size 8 --share_embedding | python ../scripts/logp_score.py > $DIR_OUT/logp04/results.$i
        python ../scripts/logp_analyze.py --delta 0.4 < $DIR_OUT/logp04/results.$i
    fi
done
