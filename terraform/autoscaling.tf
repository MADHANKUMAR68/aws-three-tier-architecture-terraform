resource "aws_autoscaling_group" "app_asg" {
  name             = "three-tier-asg"
  desired_capacity = 2
  min_size         = 2
  max_size         = 4
  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
  target_group_arns         = [aws_lb_target_group.app_tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "three-tier-asg-instance"
    propagate_at_launch = true
  }
}
