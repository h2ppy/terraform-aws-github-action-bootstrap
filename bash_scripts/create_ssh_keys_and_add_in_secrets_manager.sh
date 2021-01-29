#!/bin/bash
NAME=$1
if [ -z "$NAME" ]
then
	 echo "Name cannot be empty"
	 exit
fi

privateKey=$(aws ec2 create-key-pair --key-name $NAME --region $AWS_REGION --query 'KeyMaterial')
if [ $? == 0 ]; then
	aws secretsmanager create-secret --name $NAME --secret-string "$privateKey" --region $AWS_REGION
else
	echo "Key already exists."
	exit 0
fi

