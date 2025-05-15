
module "s3_static_site" {
  source = "./modules/s3_static_site"
}

module "dynamodb" {
  source = "./modules/dynamodb"
  table_name = "contact_form_submissions"
}

module "lambda" {
  source         = "./modules/lambda"
  lambda_name    = "contactFormHandler"
  table_name     = module.dynamodb.table_name
}

module "api_gateway" {
  source         = "./modules/api_gateway"
  lambda_arn     = module.lambda.lambda_arn
  lambda_name    = module.lambda.lambda_name
}
