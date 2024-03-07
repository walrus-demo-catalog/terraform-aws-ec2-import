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
  default     = "unkown"
}

variable "vpc_security_group_ids" {
  description = "The VPC security group ids of the EC2 instance"
    default     = ["unkown"]
} 

variable "instance_name" {
  type        = string
  description = "The instance name of the EC2 instance"
  default     = "unkown"
}

variable "instance_type" {
  type        = string
  description = "The instance type of the EC2 instance"
  default     = "unkown"
}

variable "volume_type" {
  type        = string
  description = "The type of the root block device, defaults to the volume type that the AMI uses, valid values are gp2, gp3, io1, io2, standard"
  default     = "unkown"
}

variable "volume_size" {
  type        = number
  description = "The size of the root block device, value range: [8, 16384]"
  default     = "unkown"
}

variable "init_script" {
  type        = string
  description = "User-defined init script to customize the startup behaviors of the EC2 instance and to pass data into the EC2 instance, aka user_data"
  default     = "unkown"
}

variable "key_name" {
  type        = string 
  description = "Name of the ssh private key, must already exist"
  default     = "unkown"
}
