data "aws_availability_zones" "available" {
}

resource "aws_elb" "example" {
  name               = "${var.name}-${var.environment}"
  security_groups    = [aws_security_group.elb.id]
  availability_zones = data.aws_availability_zones.available.names
  // health_check {
  //   healthy_threshold   = 2
  //   unhealthy_threshold = 2
  //   timeout             = 3
  //   interval            = 30
  //   target              = "HTTP:80/"
  // }
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}

resource "aws_security_group" "elb" {
  name = "${var.name}-${var.environment}"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb_attachment" "this" {
  count = var.number_of_instances

  elb      = aws_elb.example.id
  instance = element(var.instances, count.index)
}