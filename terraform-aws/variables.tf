variable "aws_region" {
  description = "region for infra."
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "ec2 size."
  type = string
  default = "t3.micro" 
}

