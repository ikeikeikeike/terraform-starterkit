resource "aws_s3_bucket" "sample" {
    bucket = "abcd23-sample"
    acl = "public-read"

    tags {
        Name = "Sample bucket"
        Environment = "Dev"
    }
}

# TODO:
# resource "aws_s3_bucket_policy" "sample" {
  # bucket = "${aws_s3_bucket.sample.id}"
  # policy = "${data.aws_iam_policy_document.sample.json}"
# }
