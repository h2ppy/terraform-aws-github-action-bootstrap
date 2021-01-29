#!/bin/bash
NAME=$1
if [ -z "$NAME" ]
then
	 echo "Name cannot be empty"
	 exit
fi

aws ec2 describe-key-pairs --key-names $NAME
if [ $? == 0 ]; then
	echo "Already exists"
	exit 1;
else
	ssh-keygen -q -t rsa -m PEM -N '' -f $NAME <<< y
	aws secretsmanager create-secret --name $NAME --secret-string file://$NAME
	echo "Key successfully inserted in secrets manager."
fi

echo $NAME
echo $keyPair

