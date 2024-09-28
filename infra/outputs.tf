output "cloudfront_distribution_id" {
  description = "Cloudfront distribution ID string."
  value       = aws_cloudfront_distribution.this.id
}
output "s3_bucket_id" {
  description = "S3 bucket id string."
  value       = aws_s3_bucket.this.id
}
output "distribution_domain_name" {
  description = "The cloudfront distributions's domain name."
  value       = aws_cloudfront_distribution.this.domain_name
}
output "vanity_domain" {
  description = "Human friendly vanity domain if present."
  value       = local.route53_records[var.environment]
}