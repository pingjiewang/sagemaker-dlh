python preprocess.py --train data/qed/train_pairs.txt --vocab data/qed/vocab.txt --ncpu 8 < data/qed/train_pairs.txt
mkdir processed_qed
mv tensor* processed_qed/

python preprocess.py --train data/drd2/train_pairs.txt --vocab data/drd2/vocab.txt --ncpu 8 < data/drd2/train_pairs.txt
mkdir processed_drd2
mv tensor* processed_drd2/

python preprocess.py --train data/logp04/train_pairs.txt --vocab data/logp04/vocab.txt --ncpu 8 < data/logp04/train_pairs.txt
mkdir processed_logp04
mv tensor* processed_logp04/

python preprocess.py --train data/logp06/train_pairs.txt --vocab data/logp06/vocab.txt --ncpu 8 < data/logp06/train_pairs.txt
mkdir processed_logp06
mv tensor* processed_logp06/
