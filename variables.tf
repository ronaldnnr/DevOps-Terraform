variable "access_key" {
}


variable "secret_key" {
}

# Change the region as per your requirements, this way you can create your VMs in any zone.
variable "region" {
  default = "us-east-2"
}

# As per the region place your ami so based on that AMI the new VMs will be created.
variable "ami_id" {
  default = "ami-026dea5602e368e96"
}
