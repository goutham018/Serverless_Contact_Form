
resource "aws_dynamodb_table" "contact_form" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "submission_id"

  attribute {
    name = "submission_id"
    type = "S"
  }

  tags = {
    Project = "ServerlessContactForm"
  }
}
