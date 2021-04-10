#!/bin/bash

DIR=$1
NUM=$2

for ((i=1; i<NUM; i++)); do
    f=$DIR/model.iter-$i
    if [ -e $f ]; then
        echo $f
        python decode_validation.py --test ../data/qed/valid.txt --vocab ../data/qed/vocab.txt --model $f --hidden_size 300 --rand_size 8 --use_molatt | python ../scripts/qed_score.py > $DIR/results.$i
        python ../scripts/qed_analyze.py < $DIR/results.$i
    fi
done
