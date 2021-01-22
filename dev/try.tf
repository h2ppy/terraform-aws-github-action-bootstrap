resource "null_resource" "get_target_group_arn" {
  provisioner "local-exec" {
    command = "aws elbv2 describe-target-groups --region us-east-1 --load-balancer-arn ${module.base.aws_elastic_beanstalk_environment_load_balancers[0]} --output text --query 'TargetGroups[?LoadBalancerArns==[`${module.base.aws_elastic_beanstalk_environment_load_balancers[0]}`]].TargetGroupArn'  > ${data.template_file.target_group_in_template.rendered}"
  }
  depends_on = [module.base]
}

data "template_file" "target_group_in_template" {
  template = "target-group.log"
}

data "local_file" "target_group_arn_in_local" {
  filename = data.template_file.target_group_in_template.rendered
  depends_on = [null_resource.get_target_group_arn]
}

output "target_group_arn" {
  value = trimspace(data.local_file.target_group_arn_in_local.content)
}

//variable "resource_label_for_auto_scaling_group" {
//  default = split("loadbalancer/", split(":", module.base.aws_elastic_beanstalk_environment_load_balancers[0])[5])[1] + "/" + split(":", trimspace(data.local_file.target_group_arn_in_local.content))[5]
//}