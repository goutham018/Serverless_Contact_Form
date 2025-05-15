
output "lambda_arn" {
  value = aws_lambda_function.contact_form.arn
}

output "lambda_name" {
  value = aws_lambda_function.contact_form.function_name
}
