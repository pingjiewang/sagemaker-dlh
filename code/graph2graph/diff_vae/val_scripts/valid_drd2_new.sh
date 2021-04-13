#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
NUM_START=$3
NUM_END=$4

for ((i=NUM_START; i<=NUM_END; i++)); do
    f=$DIR_MODEL/drd2/model.iter-$i
    if [ -e $f ]; then
        echo $f
        python decode_validation.py --test ../data/drd2/valid.txt --vocab ../data/drd2/vocab.txt --model $f --use_molatt --hidden_size 300 --rand_size 8 | python ../scripts/drd2_score.py > $DIR_OUT/drd2/results.$i
        python ../scripts/drd2_analyze.py < $DIR_OUT/drd2/results.$i
    fi
done
