resource "aws_route53_record" "roboshop" {
    for_each = aws_instance.Roboshop
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [each.value.private_ip]
}