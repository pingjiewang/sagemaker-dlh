#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
ST=$3
ED=$4

for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/qed/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test data/qed/valid.txt --vocab data/qed/vocab.txt --model $f --hidden_size 300 --embed_size 300 | python scripts/qed_score.py > $DIR_MODEL/results.$i &
    fi
done
