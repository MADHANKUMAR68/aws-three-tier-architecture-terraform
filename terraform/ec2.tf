data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "app_lt" {
  name_prefix   = "three-tier-launch-template-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }

  user_data = base64encode(<<-EOF
#!/bin/bash
set -xe
apt-get update -y
apt-get install -y apache2 awscli
systemctl enable apache2
systemctl start apache2
aws s3 cp s3://${aws_s3_bucket.app_bucket.bucket}/index.html /var/www/html/index.html
aws s3 cp s3://${aws_s3_bucket.app_bucket.bucket}/style.css /var/www/html/style.css
systemctl restart apache2
EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "three-tier-ec2"
    }
  }
}
