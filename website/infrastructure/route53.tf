resource "aws_route53_zone" "prod" {
  name = "aasanchez.me"
  tags = {
    Environment = "production"
  }
}
