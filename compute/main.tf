# bastion host creation

resource "aws_instance" "web" {
  ami           = var.AMI_ID
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.sg01_id]
  subnet_id = var.public01_id
  associate_public_ip_address = "true"
  
  tags = {
    Name = var.instance_name
  }
}

# private instance 01 creation
resource "aws_instance" "server-01" {
  ami           = var.AMI_ID
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.sg02_id]
  subnet_id = var.private01_id
  
  tags = {
    Name = var.instance02_name
  }
}

# private instance 02 creation
resource "aws_instance" "server-02" {
  ami           = var.AMI_ID
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.sg02_id]
  subnet_id = var.private02_id
  
  tags = {
    Name = var.instance03_name
  }
}


# target grp creation

resource "aws_lb_target_group" "test" {
  name     = var.TG_name
  port     = var.HTTP_port_tg
  protocol = var.protocol_type
  vpc_id   = var.vpc_id
   health_check {
    interval            = var.interval
    path                = var.path
    protocol            = var.protocol_type
    timeout             = var.timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
  
}


# target register

resource "aws_lb_target_group_attachment" "test_01" {
  target_group_arn = var.Target_group_arn
  target_id        = var.private01_vm_id
  port             = var.port_num
}

# Application Load Balancer

resource "aws_lb" "Grafana-alb" {
  name               = var.alb_name
  internal           = var.internal_value
  load_balancer_type = var.ALB_type
  security_groups    = [var.sg02_id]
  subnets            = [var.public01_id , var.public02_id]
}


# load balancer listener

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = var.ALB_arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = var.Target_group_arn
  }
}
