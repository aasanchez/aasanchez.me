resource "aws_route53_zone" "prod" {
  name = "olecasinos.com"
  tags = {
    Environment = "production"
  }
}

resource "aws_route53_zone" "dev" {
  name = "dev.olecasinos.com"
  tags = {
    Environment = "development"
  }
}
