echo "running pretraining for penalized logP"
mkdir pre_model_logP/
CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.logP-SA \
--hidden 420 --depth 3 --latent 56 --batch 40 \
--save_dir pre_model_logP/

echo "running pretraining for drd2"
mkdir pre_model_drd2/
CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.drd2 \
--hidden 420 --depth 3 --latent 56 --batch 40 \
--save_dir pre_model_drd2/

echo "running pretraining for qed"
mkdir pre_model_qed/
CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.qed \
--hidden 420 --depth 3 --latent 56 --batch 40 \
--save_dir pre_model_qed/
