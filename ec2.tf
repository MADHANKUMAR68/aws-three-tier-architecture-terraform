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

  user_data = base64encode(<<-EOF
#!/bin/bash
apt update -y
apt install -y apache2
systemctl enable apache2
systemctl start apache2
echo "<h1>Three-Tier Application Deployed via Terraform</h1>" > /var/www/html/index.html
EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "three-tier-ec2"
    }
  }
}
