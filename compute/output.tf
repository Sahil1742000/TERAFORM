# instances id 

output "private01_vm_id" {
  value = aws_instance.server-01.id
}

output "private02_vm_id" {
  value = aws_instance.server-02.id
}

output "public01_id" {
  value = aws_instance.web.id
}

# target grp output

output "Target_group_arn" {
  value = aws_lb_target_group.test.arn
}


# Application LB output

output "ALB_arn" {
  value = aws_lb.Grafana-alb.arn
}
