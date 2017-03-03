# Security Group

resource "aws_security_group" "elb_sample" {
    name = "elb_sample"
    vpc_id = "${aws_vpc.vpc_main.id}"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "elb sample sg"
}

resource "aws_security_group" "app_sample" {
    name = "app_sample"
    vpc_id = "${aws_vpc.vpc_main.id}"
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        security_groups = ["${aws_security_group.elb_sample.id}"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = "${var.ssh_allow_ip}"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "app sample sg"
}

resource "aws_security_group" "rds_sample" {
    name = "rds_sample"
    vpc_id = "${aws_vpc.vpc_main.id}"
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.app_sample.id}"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "rds sample sg"
}
