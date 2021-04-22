#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
ST=$3
ED=$4

for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/logp06/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test data/logp06/valid.txt --vocab ../rebuttal/data/logp06/vocab.txt --model $f --hidden_size 270 --embed_size 200  | sed -r '/^\s*$/d' | python scripts/logp_score.py > $DIR_OUT/logp06/results.$i &
    fi
done
