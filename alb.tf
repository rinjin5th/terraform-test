resource "aws_alb" "web" {
  name               = "iguwo-test-web"
  internal           = false
  security_groups    = ["${aws_security_group.alb.id}"]
  subnets            = ["${aws_subnet.iguwo-test-public.*.id}"]

  tags = {
    Environment = "iguwo-test-web"
  }
}

resource "aws_alb_target_group" "web" {
  name        = "iguwo-test-web"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.main.id}"
}

resource "aws_alb_target_group_attachment" "web" {
  count = 2
  target_group_arn = "${aws_alb_target_group.web.arn}"
  target_id        = "${element(aws_instance.web.*.id, count.index)}"
  port             = 80
}

resource "aws_alb_listener" "web-http" {
  load_balancer_arn = "${aws_alb.web.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.web.arn}"
  }
}