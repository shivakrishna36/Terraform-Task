#provider details
provider "aws" {
	access_key = ""
	secret_key = ""
    region     = "us-west-1"
}

#creating s3 bucket
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-alfhkjaghlk-12344"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

#inserting data.txt file in to bucket
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.bucket
  key    = "new_object_key"
  source = "data.txt"
  etag = filemd5("data.txt")
}