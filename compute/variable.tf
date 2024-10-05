variable "sg01_id" {
  type = string
}

variable "sg02_id" {
  type = string
}

variable "public01_id" {
 type = string 
}

variable "private01_id" {
  type = string
}

variable "private02_id" {
  type = string
}

variable "AMI_ID" {
  type = string
  default = "ami-0d53d72369335a9d6"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "ansible-key"
}

variable "instance_name" {
  type = string
  default = "public-instance"
}

variable "instance02_name" {
  type = string
  default = "private-instance-01"
}

variable "instance03_name" {
  type = string
  default = "private-instance-02"
}


# target group variable

variable "vpc_id" {
  type = string
}

variable "TG_name" {
  type = string
  default = "tool-tg"
}


variable "HTTP_port_tg" {
  type = string
  default = "80"
}

variable "protocol_type" {
  type = string
  default = "HTTP"
}

variable "interval" {
  type = string
  default = "30"
}

variable "timeout" {
  type = string
  default = "5"
}

variable "healthy_threshold" {
  type = string
  default = "5"
}

variable "unhealthy_threshold" {
  type = string
  default = "2"
}

variable "path" {
  type = string
  default = "/"
}


# target register

variable "Target_group_arn" {
  type = string
}

variable "private01_vm_id" {
  type = string
}

variable "port_num" {
  type = string
  default = "3000"
}

# Application Load Balancer variable

variable "public02_id" {
  type = string
}

variable "ALB_type" {
  type = string
  default = "application"
}

variable "alb_name" {
  type = string
  default = "Grafana-alb"
}

variable "internal_value" {
  type = bool
  default = false
}

# laod balancer listener

variable "ALB_arn" {
  type = string
}
