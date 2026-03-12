resource "aws_launch_template" "this" {
  name_prefix   = var.name_prefix
  image_id      = var.ami
  instance_type = var.instance_type
}
