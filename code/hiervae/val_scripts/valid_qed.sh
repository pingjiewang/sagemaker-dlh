#!/bin/bash

DIR=$1
ST=$2
ED=$3

for ((i=ST; i<=ED; i++)); do
    f=$DIR/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test data/qed/valid.txt --vocab data/qed/vocab.txt --model $f --hidden_size 300 --embed_size 300 | python scripts/qed_score.py > $DIR/results.$i &
    fi
done
