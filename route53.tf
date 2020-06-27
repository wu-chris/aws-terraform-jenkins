resource "aws_route53_record" "jenkins_record" {
  zone_id = data.aws_route53_zone.my_route53_zone.zone_id
  name    = "jenkins.xorzor.net"
  type    = "A"
  alias {
    name                   = aws_lb.jenkins-load-balancer.dns_name
    zone_id                = aws_lb.jenkins-load-balancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "jenkins_internal_record" {
  zone_id = data.aws_route53_zone.my_route53_zone.zone_id
  name    = "jenkins-internal.xorzor.net"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.jenkins_eip.public_ip]
}

data "aws_route53_zone" "my_route53_zone" {
  name = "xorzor.net."
}

