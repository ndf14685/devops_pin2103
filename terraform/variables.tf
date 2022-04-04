variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key"
  default = "AKIA2EIPAYSJAWZEEIOI"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Key"
  default = "/FK1n2M3Kxxt4hG9cgSq2sxInJqzZJywZWZyldmS"
}

variable "AWS_SSH_KEY_NAME" {
  description = "Name of the SSH keypair to use in AWS."
  default = "ec2-key"  
}

variable "AWS_DEFAULT_REGION" {
  description = "AWS Region"
  default = "us-east-2"
}