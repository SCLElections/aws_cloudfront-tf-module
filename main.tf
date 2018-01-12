resource "aws_cloudfront_distribution" "main" {
  count = "${var.production}"

  origin {
    domain_name = "${var.domain-name}"
    origin_id   = "site_elb"

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled = true

  aliases = "${var.aliases}"

  lifecycle {
    create_before_destroy = true
  }

  is_ipv6_enabled = true
  price_class     = "PriceClass_All"

  default_cache_behavior {
    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    target_origin_id = "site_elb"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 60
    default_ttl            = 90
    max_ttl                = 300
  }

  viewer_certificate {
    acm_certificate_arn      = "${var.acm_certificate_arn}"
    minimum_protocol_version = "TLSv1.1_2016"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags {
    Name                   = "cdn-${var.tags["Name"]}"
    project                = "${var.tags["project"]}"
    application            = "${var.tags["application"]}"
    environment            = "${var.tags["environment"]}"
    cost-center            = "${var.tags["cost-center"]}"
    creator                = "${var.tags["creator"]}"
    responsible-department = "${var.tags["responsible-department"]}"
    type                   = "${var.tags["type"]}"
    responsible-party      = "${var.tags["responsible-party"]}"
  }
}
