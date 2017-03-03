data "aws_iam_policy_document" "sample" {
    statement {
        sid = "1"
        effect = "Allow"
        actions = [
            "s3:ListAllMyBuckets",
            "s3:GetBucketLocation",
        ]
        resources = [
            "arn:aws:s3:::*",
        ]
        # principals {
          # type        = "AWS"
          # identifiers = ["*"]
        # }
    }

    statement {
        effect = "Allow"
        actions = [
            "s3:ListBucket",
        ]
        resources = [
            "arn:aws:s3:::abcd23-sample",
        ]
        # principals {
          # type        = "AWS"
          # identifiers = ["*"]
        # }
    }

    statement {
        effect = "Allow"
        actions = [
            "s3:*",
        ]
        resources = [
            "arn:aws:s3:::abcd23-sample",
            "arn:aws:s3:::abcd23-sample/*",
        ]
        # principals {
          # type        = "AWS"
          # identifiers = ["*"]
        # }
    }

}

resource "aws_iam_policy" "sample" {
    name = "sample_policy"
    path = "/"
    policy = "${data.aws_iam_policy_document.sample.json}"
}
