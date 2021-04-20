#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
ST=$3
ED=$4

for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/qed/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test ../data/molopt/qed/valid.txt --vocab ../data/molopt/qed/align_vocab.txt --model $f --enum_root --hidden_size 270 --embed_size 200 | python ../scripts/qed_score.py > $DIR_MODEL/qed/results.$i &
    fi
done
