variable "instance_id" {
  type       = string
  description = "The instance id of the EC2 instance"
}

variable "ami_id" {
  type        = string
  description = "The ami id of the EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "The subnet id of the EC2 instance"
}

variable "vpc_security_group_ids" {
  description = "The VPC security group ids of the EC2 instance"
} 

variable "instance_name" {
  type        = string
  description = "The instance name of the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The instance type of the EC2 instance"
}

variable "volume_type" {
  type        = string
  description = "The type of the root block device, defaults to the volume type that the AMI uses, valid values are gp2, gp3, io1, io2, standard"
}

variable "volume_size" {
  type        = number
  description = "The size of the root block device, value range: [8, 16384]"
}

variable "init_script" {
  type        = string
  description = "User-defined init script to customize the startup behaviors of the EC2 instance and to pass data into the EC2 instance, aka user_data"
}

variable "key_name" {
  type        = string 
  description = "Name of the ssh private key, must already exist"
}
