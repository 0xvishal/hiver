resource "aws_lb" "nlb" {
  name               = "elb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [var.private-subnet1,var.private-subnet2]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "tg1" {
  name     = "tg1"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc
}


resource "aws_lb_target_group" "tg2" {
  name     = "tg2"
  port     = 443
  protocol = "TCP"
  vpc_id   = var.vpc
}


resource "aws_lb_target_group_attachment" "tga1" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.prod-web-server-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tga2" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.prod-web-server-1.id
  port             = 443
}


resource "aws_lb_target_group_attachment" "tga3" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.prod-web-server-2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tga4" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.prod-web-server-2.id
  port             = 443
}


resource "aws_lb_listener" "lbl1" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}


resource "aws_lb_listener" "lbl2" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2.arn
  }
}
