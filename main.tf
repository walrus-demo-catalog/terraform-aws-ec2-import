terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

resource "aws_instance" "ec2" {
  tags = {
    "Name" = var.instance_name
  }
  instance_type = var.instance_type
  ami           = data.aws_ami.ami_ds.id

  subnet_id                   = values(data.aws_subnet.selected)[0].id
  vpc_security_group_ids      = [data.aws_security_group.selected.id]
  associate_public_ip_address = true

  key_name = var.key_name

  user_data = var.init_script

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
}

data "aws_vpc" "selected" {
  default = true
  state   = "available"
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "default-for-az"
    values = [true]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_subnet" "selected" {
  for_each = toset(data.aws_subnets.selected.ids)
  id       = each.value
}

data "aws_security_group" "selected" {
  vpc_id = data.aws_vpc.selected.id
  name   = "default"
}

data "aws_ami" "ami_ds" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["099720109477"] # Canonical
}
