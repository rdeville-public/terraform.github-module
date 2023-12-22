variable "user_gpgkeys" {
  type    = map(string)
  default = {}
}

variable "user_sshkeys" {
  type = map(object({
    key = string
  }))

  default = {}
}
