#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
NUM_START=$3
NUM_END=$4

for ((i=NUM_START; i<=NUM_END; i++)); do
    f=$DIR_MODEL/model.iter-$i
    if [ -e $f ]; then
        echo $f
        python decode_validation.py --test ../data/qed/valid.txt --vocab ../data/qed/vocab.txt --model $f --hidden_size 300 --rand_size 8 --use_molatt | python ../scripts/qed_score.py > $DIR_OUT/results.$i
        python ../scripts/qed_analyze.py < $DIR_OUT/results.$i
    fi
done
