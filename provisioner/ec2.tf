resource "aws_instance" "Roboshop" {
    
    ami           = "ami-09c813fb71547fc4f"
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    provisioner "local-exec"{
        command = "echo ${self.private_ip} > inventory"
    }

    tags = var.ec2_tags
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
