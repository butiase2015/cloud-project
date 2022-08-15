variable "launch_configuration" {
    type = string
    description = "Launch Config name"
  
}

variable "min_instance"{
    type = number
    
}

variable "max_instance"{
    type = number
    
}

variable "load_balancers" {
    type = list(string)
  
}

variable "health_check_type" {
    type = string
  
}


variable "tag_key"{
    type = string 
}



variable "tag_propagate_at_launch"{
    type = bool 
}
