output arn {
  value = aws_s3_bucket.this.arn
  description = "The resulting ARN from the created S3 Bucket"
}

output name {
  value = aws_s3_bucket.this.id
  description = "The name of the created bucket, should be the same that was passed in"
}
