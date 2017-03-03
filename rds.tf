# RDS

resource "aws_db_subnet_group" "mysql" {
  name = "${var.app_name}-rds-subnet"
  description = "${var.app_name} MultiAZ"
  subnet_ids = ["${aws_subnet.vpc_main-private-subnet1.id}", "${aws_subnet.vpc_main-private-subnet2.id}"]
}

resource "aws_db_parameter_group" "sample" {
    name = "rds-mysql"
    family = "${var.rds_family}"

    parameter {
      name = "character_set_server"
      value = "utf8"
    }
    parameter {
      name = "character_set_client"
      value = "utf8"
    }
}

resource "aws_db_instance" "default" {
  allocated_storage       = "${var.rds_allocated_storage}"
  identifier              = "${var.rds_name}"
  engine                  = "${var.rds_engine}"
  engine_version          = "${var.rds_engine_version}"
  instance_class          = "${var.rds_instane_type}"
  name                    = "${var.rds_db_name}"
  username                = "${var.rds_user}"
  password                = "${var.rds_pass}"
  db_subnet_group_name    = "${aws_db_subnet_group.mysql.id}"
  parameter_group_name    = "${aws_db_parameter_group.sample.id}"
  vpc_security_group_ids  = ["${aws_security_group.rds_sample.id}"]
  backup_retention_period = "1"
  backup_window           = "17:08-17:38"
  storage_type            = "gp2"
  maintenance_window      = "Sat:13:38-Sat:14:08"
  multi_az                = "${var.rds_multi_az}"
  apply_immediately       = true
  publicly_accessible     = true
}
