variable "organization" {
  // See https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group
  type = object({
    name                                                         = optional(string, null)
    billing_email                                                = optional(string, "")
    description                                                  = optional(string, null)
    company                                                      = optional(string, null)
    blog                                                         = optional(string, null)
    email                                                        = optional(string, null)
    twitter_username                                             = optional(string, null)
    location                                                     = optional(string, null)
    has_organization_projects                                    = optional(string, null)
    has_repository_projects                                      = optional(string, null)
    default_repository_permission                                = optional(string, "read")
    members_can_create_repositories                              = optional(bool, false)
    members_can_create_public_repositories                       = optional(bool, false)
    members_can_create_private_repositories                      = optional(bool, false)
    members_can_create_internal_repositories                     = optional(bool, false)
    members_can_create_pages                                     = optional(bool, false)
    members_can_create_public_pages                              = optional(bool, false)
    members_can_create_private_pages                             = optional(bool, false)
    members_can_fork_private_repositories                        = optional(bool, false)
    web_commit_signoff_required                                  = optional(bool, true)
    advanced_security_enabled_for_new_repositories               = optional(bool, true)
    dependabot_alerts_enabled_for_new_repositories               = optional(bool, true)
    dependabot_security_updates_enabled_for_new_repositories     = optional(bool, true)
    dependency_graph_enabled_for_new_repositories                = optional(bool, true)
    secret_scanning_enabled_for_new_repositories                 = optional(bool, true)
    secret_scanning_push_protection_enabled_for_new_repositories = optional(bool, true)

    # branch_default = optional(object({
    #   branch  = optional(string, "main")
    #   default = optional(bool, true)
    #   }),
    #   {
    #     branch  = "main"
    #     default = true
    # })

    # branch_protected = optional(map(object({
    #   // Key is just an identifier
    #   pattern                         = optional(string, "main")
    #   enforce_admins                  = optional(bool, true)
    #   require_signed_commits          = optional(bool, true)
    #   required_linear_history         = optional(bool, true)
    #   require_conversation_resolution = optional(bool, true)
    #   push_restrictions               = optional(string, null)
    #   force_push_bypassers            = optional(string, null)
    #   allows_deletions                = optional(bool, false)
    #   allows_force_pushes             = optional(bool, false)
    #   blocks_creations                = optional(bool, false)
    #   lock_branch                     = optional(bool, false)

    #   required_status_checks = optional(object({
    #     strict   = optional(bool, true)
    #     contexts = optional(string, null)
    #   }), null)

    #   required_pull_request_reviews = optional(object({
    #     dismiss_stale_reviews           = optional(bool, false)
    #     restrict_dismissals             = optional(bool, true)
    #     dismissal_restrictions          = optional(string, null)
    #     pull_request_bypassers          = optional(string, null)
    #     require_code_owner_reviews      = optional(bool, true)
    #     required_approving_review_count = optional(number, 0)
    #     require_last_push_approval      = optional(bool, true)
    #   }), null)

    # })))

    # labels = optional(map(object({
    #   // Key is label name
    #   color       = string
    #   description = optional(string)
    # })), null)

    # tag_protection = optional(map(object({
    #   // Key is just an identifier
    #   pattern = optional(string, "v*")
    # })), null)
  })
}
