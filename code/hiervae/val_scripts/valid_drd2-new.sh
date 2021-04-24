#!/bin/bash

DIR_MODEL=$1/drd2
DIR_OUT=$2/drd2
ST=$3
ED=$4

echo "\n\n **********"
echo "begin to validate drd2 from $ST to $ED."
for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/model.$i
    if [ -e $f ]; then
        echo "Begin to process $f."
        python decode.py --test data/drd2/valid.txt --vocab data/drd2/vocab.txt --model $f --hidden_size 300 --embed_size 300 --latent_size 8 | sed -r '/^\s*$/d' | python scripts/drd2_score.py > $DIR_OUT/results.$i 
        echo "[python decode.py --test data/drd2/valid.txt --vocab data/drd2/vocab.txt --model $f --hidden_size 300 --embed_size 300 --latent_size 8 | sed -r '/^\s*$/d' | python scripts/drd2_score.py > $DIR_OUT/results.$i]"
    fi
echo "**********\n\n "
done
