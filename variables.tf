variable bucket_name {
  type = string
  description = "The desired name of your S3 bucket"
}

variable custom_policy {
  type = string
  description = "This allows you to override the built in bucket policy"
  default = ""
}
