resource "github_user_ssh_key" "this" {
  for_each = var.user_sshkeys

  title = each.key
  key   = each.value.key
}

resource "github_user_gpg_key" "example" {
  for_each = var.user_gpgkeys

  armored_public_key = each.value
}
