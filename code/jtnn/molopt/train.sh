echo "training logP model"
mkdir vae_model_logP/
CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.logP-SA \
--hidden 420 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 \
--model pre_model_logP/model.2 --save_dir vae_model_logP/


echo "training qed model"
mkdir vae_model_qed/
CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.qed \
--hidden 420 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 \
--model pre_model_qed/model.2 --save_dir vae_model_qed/


echo "training drd2 model"
mkdir vae_model_drd2/
CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.drd2 \
--hidden 420 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 \
--model pre_model_drd2/model.2 --save_dir vae_model_drd2/
