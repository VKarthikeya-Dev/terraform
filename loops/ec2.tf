resource "aws_instance" "Roboshop" {
    count =2
    ami           = "ami-09c813fb71547fc4f"
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    tags = {
        Name = var.instance_name[count.index]
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
