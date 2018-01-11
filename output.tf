output "domain_name" {
  value = "${element(concat(aws_cloudfront_distribution.main.*.domain_name, list("")), 0)}"
}

output "hosted_zone_id" {
  value = "${element(concat(aws_cloudfront_distribution.main.*.hosted_zone_id, list("")), 0)}"
}
