module "user" {
  source = "./user"

  user_gpgkeys = var.user.gpgkeys
  user_sshkeys = var.user.sshkeys
}

module "repos" {
  source   = "./repos"
  for_each = var.repos

  repo                   = each.value.config
  repo_labels            = each.value.labels
  repo_actions_variables = each.value.variables
  repo_tag_protection    = each.value.tag_protections
}

module "organization" {
  source = "./organization"
  count  = var.organization != null ? 1 : 0

  organization = var.organization
}

