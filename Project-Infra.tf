provider "aws" {
  region = "ap-south-1"
}

# First group of instances
variable "instance_names_one" {
  default = ["jenkins", "Monitoring-Server"]
}

resource "aws_instance" "infra_1" {
  count         = length(var.instance_names_one)
  ami           = "ami-080b1a55a0ad28c02"
  instance_type = "t2.medium"
  key_name      = "devops"
  vpc_security_group_ids = ["sg-0436b0616cc453e15"]

  tags = {
    Name = var.instance_names_one[count.index]
  }
}

# Second group of instances
variable "instance_names_two" {
  default = ["ansible", "dev-1", "dev-2", "test-1", "test-2"]
}

resource "aws_instance" "infra_2" {
  count         = length(var.instance_names_two)
  ami           = "ami-080b1a55a0ad28c02"
  instance_type = "t2.micro"
  key_name      = "devops"
  vpc_security_group_ids = ["sg-0436b0616cc453e15"]

  tags = {
    Name = var.instance_names_two[count.index]
  }
}
