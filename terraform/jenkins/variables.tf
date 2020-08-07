variable "name" {
    description = "Name the instance on deploy"
}
variable "ssh_key_private" {
  default     = "~/.ssh/infra-key.pem"
  description = "Path to the SSH"
}