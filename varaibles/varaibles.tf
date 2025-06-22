variable"ami_id"{
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "ami id of joindevops RHEL9"
}

variable"instance_type"{
    default = "t3.micro"    
}

variable"ec2_tags"{
    type = map(string)
    default ={
        Name = "mongodb"
        Purpose = " variables demo"
    }
}
variable"sg_name"{
    type = string
    default ="allow_all"    
}
variable"from_port"{
    type = number
    default = 0
}

variable"cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable"sg_tag"{
    type = map(string)
    default = {
        Name = "allow_all"
    }
}