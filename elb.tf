resource "aws_elb" "sample" {
  name = "sample"
  security_groups = ["${aws_security_group.elb_sample.id}"]
  subnets = ["${aws_subnet.vpc_main-public-subnet1.id}","${aws_subnet.vpc_main-public-subnet2.id}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    target = "HTTP:80/index.html"
    interval = 30
  }
}
