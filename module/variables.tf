variable "ecr_name" {
  description = "ECR Registry name" 
  type = any 
  default = null
}

variable "image_mutability" {
  description = "Image mutability on or off" 
  type = string
  default = "IMMUTABLE"
}

variable "encrypt_type" {
  description = "Encryption type" 
  type = string
  default = "KMS"
}

variable "tags" {
  description = "tag mapping" 
  type = map(string)
  default = {}
}
