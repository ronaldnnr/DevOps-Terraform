provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


resource "aws_security_group" "onefish4" {
  name        = "jellyfish-one4"
  description = "Allow all traffic to anywhere"
  ingress {
    protocol  = -1
    self      = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "my_sg_tag"
       }
  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_key_pair" "terraform-key" {

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7pjjqG8P8i1Bff/KSCYa0gld6htxuNRMf6pCB8AkrlSJZjMxgP11HFDkh4yws39zXdiSaMSFtMuUJq9oUFNBS90aVhF5tIDX5K/Bh/KLMm6tYnXux+zOh03vrCao+IQsKJkZccL9j3sICrrHlJmN8Eh9vspRIFNMfuhjlZzXC4QPZl/cZYal5aofyJcdQc0N3nMBp7cMnwJkZFvLqtyqZwzUOHHCHYMnQcuXk0TSKn/456IXeBAche+WrtRoBMA8EXg5TbRdCoFLPmMzoydOsAWTQr6DvBCjeExu6OohrX5khLWkPKBh5YCR4nv2/kssoibYjJPr0Hh9wHzyq08rD root@ip-172-31-34-230"

}



##Create masters instances
resource "aws_instance" "ec2-master" {
  ami                         = "${var.ami_id}"
  key_name                    = "assessment-roland"
  user_data                   = "${file("user-data.sh")}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.onefish4.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "Terraformed-Machine-auto000"
  }
}

