variable "aws_region" {
  description = "The AWS region where the main provider will be pointed to."
  type        = string
}
variable "environment" {
  description = "The deployment stage/environment of this deploy (dev/staging/prod/etc.)."
  type        = string
}
variable "project" {
  description = "A name that labels this specific project within an app deploy."
  type        = string

}
variable "tf_state_bucket" {
  description = "The s3 bucket where state is stored."
  type        = string
}
variable "tf_state_key" {
  description = "The s3 path where state is stored."
  type        = string
}
variable "source_control" {
  description = "The source control repo of this deploy."
  type        = string
}
variable "source_version" {
  description = "Version string associated with release of this project."
  type        = string
}
variable "hosted_zone_id" {
  description = "The AWS Route53 hosted zone where records should be created."
  type        = string
}
variable "certificate_arn" {
  description = "The AWS ACM certificate arn for SLL on the cloudfront."
  type        = string
}