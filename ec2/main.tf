resource "aws_instance" "jenkins_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  security_groups             = var.sg_for_jenkins
  associate_public_ip_address = var.enable_public_ip_address
  key_name                    = aws_key_pair.ec2_instance_public_key.key_name
  tags = {
    Name = var.tag_name
  }

  lifecycle {
    ignore_changes  = [ami, tags, associate_public_ip_address]
  }


  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_key_pair" "ec2_instance_public_key" {
  key_name   = "aws_ec2_terraform"
  public_key = var.public_key
}

