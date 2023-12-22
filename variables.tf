# Organization Variables
# ----------------------------------------------------------------------------
# See ./groups/variable.tf
variable "organization" {
  type    = map(any)
  default = null
}

# Repository Variables
# ----------------------------------------------------------------------------
# See ./projects/variable.tf
variable "repos" {
  type = map(object({
    config             = optional(map(any))
    labels             = optional(map(any))
    variables          = optional(map(any))
    branch_protections = optional(map(any))
    tag_protections    = optional(map(any))
  }))
  default = {}
}

# Users Variables
# ----------------------------------------------------------------------------
# See ./users/variable.tf

variable "user" {
  type = object({
    gpgkeys = optional(map(string), {})
    sshkeys = optional(map(object({
      key = string
    })), {})
  })

  default = {}
}
