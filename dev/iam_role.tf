data "aws_iam_policy" "AWSElasticBeanstalkWebTier" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}
data "aws_iam_policy" "AWSElasticBeanstalkMulticontainerDocker" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}
data "aws_iam_policy" "AWSElasticBeanstalkWorkerTier" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkMulticontainerDocker-policy-attach" {
  role       = aws_iam_role.dev-ec2-role
  policy_arn = data.aws_iam_policy.AWSElasticBeanstalkMulticontainerDocker
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkWebTier-policy-attach" {
  role       = aws_iam_role.dev-ec2-role
  policy_arn = data.aws_iam_policy.AWSElasticBeanstalkWebTier
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkWorkerTier-policy-attach" {
  role       = aws_iam_role.dev-ec2-role
  policy_arn = data.aws_iam_policy.AWSElasticBeanstalkWorkerTier
}
resource "aws_iam_role" "dev-ec2-role" {
  name = "dev-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}