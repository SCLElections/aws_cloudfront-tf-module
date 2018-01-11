variable "domain-name" {
  description = "Domain name for the cloudfront distribution"
}

variable "aliases" {
  type        = "list"
  description = "List of domain to add as alias to the distribution."
}

variable "acm_certificate_arn" {
  description = "SSL Certificate arn to use for the cloudfront distribution."
}

variable "production" {
  default     = true
  description = "Used to prevent alias from being created in staging if only need in production."
}

variable "tags" {
  type = "map"
}
