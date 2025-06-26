resource "aws_route53_record" "roboshop" {
    count = 2
    zone_id = var.zone_id
    name    = "${var.instance_name[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.Roboshop[count.index].private_ip]
}