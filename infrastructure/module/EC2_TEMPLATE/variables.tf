variable "image_id" {
    type= string
  
}

variable "security_groups" {
    type= list(string)
  
}

variable "user_data" {
    type= string
  
}
variable "destroy" {
    type= bool
  
}


