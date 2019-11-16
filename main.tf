terraform {
  required_version = ">= 0.12"
}

resource aws_s3_bucket_policy force_encryption {
  bucket = aws_s3_bucket.this.bucket
  count = "${var.custom_policy == "" ? 1 : 0}"
  policy = templatefile("${path.module}/templates/json/defaultPolicy.json",{
    bucket_arn = aws_s3_bucket.this.arn
  })
}

resource aws_s3_bucket_policy custom_policy {
  count = "${var.custom_policy != "" ? 1 : 0}"
  bucket = aws_s3_bucket.this.bucket
  policy = var.custom_policy
}

resource aws_s3_bucket this {
  bucket = "${var.bucket_name}"

  versioning {
    enabled = "true"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
