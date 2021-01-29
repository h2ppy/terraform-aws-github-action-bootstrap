#!/bin/bash
NAME=$1
if [ -z "$NAME" ]
then
	 echo "Name cannot be empty"
	 exit
fi

privateKey=$(aws ec2 create-key-pair --key-name $NAME --query 'KeyMaterial')
if [ $? == 0 ]; then
	aws secretsmanager create-secret --name $NAME --secret-string "$privateKey"
else
	echo "Key already exists."
	exit 0
fi

