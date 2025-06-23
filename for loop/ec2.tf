resource "aws_instance" "Roboshop" {
    # for_each = var.instance_name 
    for_each = toset(var.instance_name)
    ami           = "ami-09c813fb71547fc4f"
    # instance_type = each.value
    instance_type ="t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    tags = {
        Name = each.key
    }
}
resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "Allow all inbound traffic and all outbound traffic"
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
    Name = "allow_all"
    }
}
