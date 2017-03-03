# Verliable definition

# AWS
variable "access_key" {}
variable "secret_key" {}
variable "region" {}

# App
variable "app_name" {}

# Segment
variable "root_segment" {}
variable "public_segment1" {}
variable "public_segment2" {}
variable "private_segment1" {}
variable "private_segment2" {}

# AZ
variable "public_segment1_az" {}
variable "public_segment2_az" {}
variable "private_segment1_az" {}
variable "private_segment2_az" {}

# SG
variable "ssh_allow_ip" {
  type = "list"
}

# KeyPair
variable "my_public_key" {}

# RDS
variable "rds_name" {}
variable "rds_engine" {}
variable "rds_engine_version" {}
variable "rds_instane_type" {}
variable "rds_db_name" {}
variable "rds_user" {}
variable "rds_pass" {}
variable "rds_family" {}
variable "rds_allocated_storage" {}
variable "rds_multi_az" {}
