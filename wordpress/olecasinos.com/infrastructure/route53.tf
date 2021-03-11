resource "aws_route53_zone" "prod" {
  name = "olecasinos.com"
  tags = {
    Environment = "production"
  }
}
