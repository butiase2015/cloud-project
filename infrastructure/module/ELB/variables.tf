
variable "elb_port"{
    type= number

}
variable "lb_protocol"{
    type= number

}
variable "instance_port"{
    type= number

}
variable "instance_protocol"{
    type= number

}

variable "health_check_interval"{
    type= number

}
variable "health_check_timeout"{
    type= number

}
variable "healthy_threshold"{
    type= number

}
variable "unhealthy_threshold"{
    type= number

}

variable "server_port"{
    type= number

}

variable "security_groups"{
    type= list(string)

}
variable "elb_name"{
    type= string

}

