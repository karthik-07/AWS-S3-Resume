resource "aws_lb" "balancer_instance" {
    name = "balancing-load-ec2"
    internal = false
    load_balancer_type = "application"
    security_groups = var.sg_for_lb
    subnets = var.subnet_ids
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.balancer_instance.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Service Unavilabe"
      status_code = "503"
    }
  }
}

resource "aws_lb_listener_rule" "s3_primary" {
  listener_arn = aws_lb_listener.front_end.arn
  priority = 1

  action {
    type = "redirect"
    redirect {
      host = var.s3_website_endpoint
      port = "80"
      protocol = "HTTP"
      status_code = "HTTP_302"
    }
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}





