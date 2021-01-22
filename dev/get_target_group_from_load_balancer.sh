eval "$(jq -r '@sh "LOAD_BALANCER_ARN=\(.load_balancer_arn)"')"

target=`aws elbv2 describe-target-groups --region us-east-1 --load-balancer-arn $LOAD_BALANCER_ARN --output json --query "TargetGroups[?LoadBalancerArns==[\`$LOAD_BALANCER_ARN\`]]"`

$target[0]
#{"target":$target}