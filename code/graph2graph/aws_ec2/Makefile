test:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type t2.small \
		--user-data file://run_script.txt

test1:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type t3.large \
		--user-data file://run_script.txt


start_clean:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type t2.medium 