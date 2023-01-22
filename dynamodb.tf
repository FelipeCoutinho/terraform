resource "aws_dynamodb_table" "basic-dynamodb-table" {
  provider = "aws.us-east-2"
  name           = "dynamodb_hml"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags = {
    Name        = "dynamodb_hml"
    Environment = "HML"
  }
}