# resource "aws_elasticache_cluster" "redis" {
    # cluster_id = "${var.cache_cluster_name}"
    # engine = "redis"
    # node_type = "${var.cache_instane_type}"
    # port = 6379
    # num_cache_nodes = 1
    # parameter_group_name = "${var.cache_parameter_group}"
    # security_group_ids = ["${aws_security_group.redis_sg.id}"]
    # subnet_group_name = "${aws_elasticache_subnet_group.subnet.id}"
# }

# resource "aws_elasticache_subnet_group" "subnet" {
    # name = "${var.cache_cluster_name}"
    # description = "${var.cache_cluster_name}"
    # subnet_ids = ["${aws_subnet.vpc_main-public-subnet1.id}","${aws_subnet.vpc_main-public-subnet2.id}"]
# }
