locals {
  root_domain = "jamescate.com"

  route53_records = {
    prod = {
      root = local.root_domain
      www  = "www.${local.root_domain}"
    }
    beta = {
      root = "beta.${local.root_domain}"
    }
  }

  root_origin_id = "${local.root_s3_bucket_name[var.environment]}-origin"
  root_s3_bucket_name = {
    prod = local.root_domain
    beta = "beta.${local.root_domain}"
  }

  weordl_origin_id = "weordl-origin"
  weordl_s3_bucket_name = {
    prod = "weordl.com"
    beta = "beta.weordl.com"
  }
}

data "aws_s3_bucket" "weordl" {
  bucket = local.weordl_s3_bucket_name[var.environment]
}

data "aws_iam_policy_document" "s3_bucket" {
  statement {
    sid       = "OACAccessOnly"
    effect    = "Allow"
    actions   = toset(["s3:GetObject"])
    resources = toset(["${aws_s3_bucket.this.arn}/*"])

    principals {
      type        = "Service"
      identifiers = toset(["cloudfront.amazonaws.com"])
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = toset([aws_cloudfront_distribution.this.arn])
    }
  }
}