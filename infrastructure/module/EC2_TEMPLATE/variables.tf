variable "image_id" {
  type = string

}
variable "instance_type" {
  type = string

}



variable "security_groups" {
  type = list(string)

}

variable "user_data" {
  type = string

}

