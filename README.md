# aws_cloudfront-tf-module
Module for creating AWS Cloudfront distributions

## Example

```hcl-terraform
module "cloudfront" {
  source     = "git@github.com:SCLElections/aws_cloudfront"
  production = true
  aliases = [
    "example1.cambridgeanalytica.org",
    "www.example.cambridgeanalytica.org",
    "www.example1.cambridgeanalytica.org",
  ]

  domain-name         = "example.cambridgeanalytica.org"
  tags           = {
    Name                   = "projectname"
    project                = "github-repo-name"
    application            = "project-code"
    environment            = "production"
    cost-center            = "0000"
    type                   = "project-type"
    creator                = "filipe.ferreira@sclgroup.cc"
    responsible-department = "Engineering"
    responsible-party      = "SCL"
  }
  acm_certificate_arn = "arn:aws:acm:us-east-1:398872337587:certificate/419498e2-aec8-41dc-9838-e86da1299f23"
}
```

## Input Variables
* **domain-name** - **[string]** - (required) - Domain name for the cloudfront distribution.
* **aliases** - **[list]** - (required) - List of domain to add as alias to the distribution.
* **acm_certificate_arn** - **[string]** - (required) - List of domain to add as alias to the distribution.
* **tags** - **[map]** - (required) - AWS resource tags following company recommended.  
* **production** - **[boolean]** - (default: true) - Used to prevent alias from being created in staging if only need in production.

## Output Variables
* **domain_name** - Fully qualified domain name for the cloudfront distribution.
* **hosted_zone_id** - DNS zone id for the cloudfront distribution.





