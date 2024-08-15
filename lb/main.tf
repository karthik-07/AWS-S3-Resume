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
      type = "forward"
      target_group_arn = aws_lb_target_group.s3_tg.arn
    }
}

resource "aws_lb_target_group" "ec2_tg" {
    name = "ec2-resume-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
      path = "/index.html"
      healthy_threshold = 2
      unhealthy_threshold = 10
      timeout = 5
      interval = 30
      matcher = "200"
    } 
}

resource "aws_lb_target_group_attachment" "ec2_tg_attachment" {
    target_group_arn = aws_lb_target_group.ec2_tg.arn
    target_id = var.ec2_instance_id
    port = 80  
}

# resource "aws_lb_target_group" "ec2_tg" {
#     name = "ec2-resume-tag"
#     port = 80
#     protocol = "HTTP"
#     vpc_id = var.vpc_id  
# }

# resource "aws_lb_target_group_attachment" "ec2_tg_attachment" {
#     target_group_arn = aws_lb_target_group.ec2_tg.arn
#     target_id = var.ec2_instance_id
#     port = 80  
# }

resource "aws_lb_listener_rule" "s3_to_ec2_failover" {
    listener_arn = aws_lb_listener.front_end.arn
    priority = 100

    action {
      type = "forward"
      redirect {
        host = var.s3_website_endpoint
        port = "80"
        protocol = "HTTP"
        status_code = "HTTP_302"
      }
    }

    condition {
      path_pattern {
        values = ["/"]
      }
    }
}

