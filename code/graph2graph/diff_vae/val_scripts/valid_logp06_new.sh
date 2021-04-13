#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
NUM_START=$3
NUM_END=$4

for ((i=NUM_START; i<=NUM_END; i++)); do
    f=$DIR_MODEL/logp06/model.iter-$i
    if [ -e $f ]; then
        echo $f
        python decode_validation.py --test ../data/logp06/valid.txt --vocab ../data/logp06/vocab.txt --model $f --rand_size 8 --hidden_size 300 --share_embedding | python ../scripts/logp_score.py > $DIR_OUT/logp06/results.$i
        python ../scripts/logp_analyze.py --delta 0.6 < $DIR_OUT/logp06/results.$i
    fi
done
