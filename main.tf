# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-3135ea1c
#
# Your security group ID is:
#
#     sg-57e40c2a
#
# Your AMI ID is:
#
#     ami-c9580bde
#
# Your Identity is:
#
#     datapipe-lynx
#

variable aws_access_key {}

variable aws_secret_key {}

variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "exercise-1" {
  ami                     = "ami-c9580bde"
  instance_type           = "t2.micro"
  subnet_id               = "subnet-3135ea1c"
  disable_api_termination = "false"
  vpc_security_group_ids  = ["sg-57e40c2a"]
  count                   = 1

  tags {
    Identity = "datapipe-lynx"
  }
}

output "public_ip" {
  value = ["${aws_instance.exercise-1.*.public_ip}"]
}

output "public_dns" {
  value = ["${aws_instance.exercise-1.*.public_dns}"]
}
