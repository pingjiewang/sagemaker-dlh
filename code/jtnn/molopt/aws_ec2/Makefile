
pretrain_logp_small: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2\
		--instance-type g4dn.xlarge \
		--user-data file://run_pretrain_logp_small.txt

start-clean: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type t3.medium 
