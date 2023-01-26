data "aws_route53_zone" "cgit" {
  name="cgitedu.com."
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.cgit.zone_id
  name    = "dev.cgitedu.com"
  type    = "A"
   alias {
    name                   = module.dev_elb.elb_dns_name
    zone_id                = module.dev_elb.elb_zone_id
    evaluate_target_health = true
  }
}