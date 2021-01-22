{
 "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "Subscription" : {
      "Type" : "AWS::SNS::Subscription",
      "Properties" : {
        "Endpoint" : "${email}",
        "Protocol" : "email",
        "TopicArn" : "${sns_topic_arn}"
      }
    }
  }
}