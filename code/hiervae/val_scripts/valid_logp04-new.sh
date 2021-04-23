#!/bin/bash

DIR_MODEL=$1/logp04
DIR_OUT=$2/logp04
ST=$3
ED=$4

for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test data/logp04/valid.txt --vocab data/logp04/vocab.txt --model $f --hidden_size 300 --embed_size 300 --latent_size 8 | sed -r '/^\s*$/d' | python scripts/logp_score.py  > $DIR_OUT/results.$i 
    fi
done
