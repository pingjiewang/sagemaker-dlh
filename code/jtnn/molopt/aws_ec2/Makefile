
pretrain_logp: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_logp.txt

pretrain_qed: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_qed.txt

pretrain_drd2: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_drd2.txt

# -------  small dataset ----

pretrain_logp_small: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_logp_small.txt

pretrain_qed_small: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_qed_small.txt

pretrain_drd2_small: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_drd2_small.txt


start-clean: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type t3.medium 

start-clean0: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2,Version=2 \
		--instance-type t3.medium 

#----s3-----

sync:
	aws s3 sync s3://output-data-drug-r-us/ ~/tmp/output-data-drug-r-us/