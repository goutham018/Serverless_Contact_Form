
resource "aws_s3_bucket" "static_site" {
  bucket = "contact-form-static-site-${random_id.rand.hex}"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.static_site.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

data "aws_iam_policy_document" "allow_public_access" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_site.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "index.html"
  source       = "${path.module}/index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "error.html"
  source       = "${path.module}/error.html"
  acl          = "public-read"
  content_type = "text/html"
}
