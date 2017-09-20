resource "aws_s3_bucket" "raaz" {
  bucket = "dev-rajtenant"
  acl    = "private"

  tags {
    Name        = "dev-rajtenant-please-delete-if-you-see-this"
    Environment = "Dev"
  }
}