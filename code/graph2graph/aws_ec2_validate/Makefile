start_clean:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t2.small 



test: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t2.small \
		--user-data file://run_script_val_qed_test.txt


train_gpu:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type g4dn.xlarge \
		--user-data file://run_script.txt

train_gpu_1_of_4:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type g4dn.xlarge \
		--user-data file://run_script_1_of_4.txt

train_gpu_2_of_4:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type g4dn.xlarge \
		--user-data file://run_script_2_of_4.txt

train_gpu_3_of_4:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type g4dn.xlarge \
		--user-data file://run_script_3_of_4.txt

train_gpu_4_of_4:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type g4dn.xlarge \
		--user-data file://run_script_4_of_4.txt


train_cpu:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type t3.large \
		--user-data file://run_script.txt




###

sync:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us

sync-model:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us
	aws s3 cp ~/sagemaker-dlh/code/graph2graph/newmodels_small 

copy-input-from-s3:
	aws s3 sync s3://input-data-drug-r-us/graph2graph_processed/ ~/sagemaker-dlh/code/graph2graph/data

output:
	aws s3 ls s3://output-data-drug-r-us/graph2graph
