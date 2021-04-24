start_clean:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t3.small 


test: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t3.small \
		--user-data file://run_script_val_qed_test.txt


val_logp06:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t3.small \
		--user-data file://run_script_val_logp06_iter_0_18.txt

val_logp04:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t3.small \
		--user-data file://run_script_val_logp04_iter_0_18.txt

val_qed:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t3.small \
		--user-data file://run_script_val_qed_iter_0_19.txt

val_drd2:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-05608d33d9bc50510 \
		--instance-type t3.small \
		--user-data file://run_script_val_drd2_iter_0_19.txt

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
