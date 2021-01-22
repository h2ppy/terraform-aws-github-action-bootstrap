eval "$(jq -r '@sh "LOAD_BALANCER_ARN=\(.load_balancer_arn)"')"

aws elbv2 describe-target-groups --region us-east-1 --load-balancer-arn $LOAD_BALANCER_ARN --output json

#echo ${!target[0]}
#{"target":$target}