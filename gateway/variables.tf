variable "projectName" {
  default = "deivi-motors"
}
variable "region" {
  description = "Região da AWS Norte da Virginia"
  type        = string
  default     = "us-east-1"
}


variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

