resource "github_organization_settings" "this" {
  name          = var.organization.name
  billing_email = var.organization.billing_email

  company                                                      = var.organization.company
  blog                                                         = var.organization.blog
  email                                                        = var.organization.email
  twitter_username                                             = var.organization.twitter_username
  location                                                     = var.organization.location
  description                                                  = var.organization.description
  has_organization_projects                                    = var.organization.has_organization_projects
  has_repository_projects                                      = var.organization.has_repository_projects
  default_repository_permission                                = var.organization.default_repository_permission
  members_can_create_repositories                              = var.organization.members_can_create_repositories
  members_can_create_public_repositories                       = var.organization.members_can_create_public_repositories
  members_can_create_private_repositories                      = var.organization.members_can_create_private_repositories
  members_can_create_internal_repositories                     = var.organization.members_can_create_internal_repositories
  members_can_create_pages                                     = var.organization.members_can_create_pages
  members_can_create_public_pages                              = var.organization.members_can_create_public_pages
  members_can_create_private_pages                             = var.organization.members_can_create_private_pages
  members_can_fork_private_repositories                        = var.organization.members_can_fork_private_repositories
  web_commit_signoff_required                                  = var.organization.web_commit_signoff_required
  advanced_security_enabled_for_new_repositories               = var.organization.advanced_security_enabled_for_new_repositories
  dependabot_alerts_enabled_for_new_repositories               = var.organization.dependabot_alerts_enabled_for_new_repositories
  dependabot_security_updates_enabled_for_new_repositories     = var.organization.dependabot_security_updates_enabled_for_new_repositories
  dependency_graph_enabled_for_new_repositories                = var.organization.dependency_graph_enabled_for_new_repositories
  secret_scanning_enabled_for_new_repositories                 = var.organization.secret_scanning_enabled_for_new_repositories
  secret_scanning_push_protection_enabled_for_new_repositories = var.organization.secret_scanning_push_protection_enabled_for_new_repositories
}
