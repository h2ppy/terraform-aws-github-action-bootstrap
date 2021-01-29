//resource "aws_acm_certificate" "cert"{
//  domain_name       = "101edu.co"
//  validation_method = "DNS"
//  subject_alternative_names = ["*.prod.101ed.co","*.staging.101edu.co","*.staging.101ed.co","*.101ed.co","*.dev.101ed.co","101ed.co","*.dev.101edu.co","*.101edu.co","*.prod.101edu.co"]
//
//  tags = {
//    Name = "101edu.co-101ed.co-combined"
//  }
//
//  lifecycle {
//    create_before_destroy = true
//  }
//}