resource "aws_elb" "web_elb" {
  name               = "terraform-elb"
  availability_zones = var.azs
  security_groups    = [aws_security_group.nodes_sg.id]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = var.web_port
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.web_port}/v2/info"
  }
}