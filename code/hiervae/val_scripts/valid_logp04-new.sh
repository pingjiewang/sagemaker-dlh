#!/bin/bash

DIR_MODEL=$1
DIR_OUT=$2
ST=$3
ED=$4

for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/logp04/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test data/logp04/valid.txt --vocab data/logp04/vocab.txt --model $f --hidden_size 170 --embed_size 170  | sed -r '/^\s*$/d' | python scripts/logp_score.py  > $DIR_OUT/logp04/results.$i &
    fi
done
