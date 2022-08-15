variable "src_port"{
    type= number

}

variable "dst_port"{
    type= number

}

variable "protocol"{
    type= string

}
variable "ingress_cidr_blocks"{
    type= list(string)

}

variable "security_group_name"{
    type= string

}


