variable "repo" {
  type = object({
    name         = string
    description  = optional(string, null)
    homepage_url = optional(string, null)

    visibility                              = optional(string, "private")
    has_issues                              = optional(bool, false)
    has_discussions                         = optional(bool, false)
    has_projects                            = optional(bool, false)
    has_wiki                                = optional(bool, false)
    is_template                             = optional(bool, false)
    allow_merge_commit                      = optional(bool, false)
    allow_squash_merge                      = optional(bool, false)
    allow_rebase_merge                      = optional(bool, true)
    squash_merge_commit_title               = optional(string, null)
    squash_merge_commit_message             = optional(string, null)
    merge_commit_title                      = optional(string, null)
    merge_commit_message                    = optional(string, null)
    delete_branch_on_merge                  = optional(bool, true)
    has_downloads                           = optional(bool, false)
    auto_init                               = optional(bool, false)
    gitignore_template                      = optional(string, null)
    license_template                        = optional(string, null)
    archived                                = optional(bool, false)
    archive_on_destroy                      = optional(bool, false)
    topics                                  = optional(list(string), null)
    ignore_vulnerability_alerts_during_read = optional(bool, false)
    allow_update_branch                     = optional(bool, true)

    security_and_analysis = optional(object({
      advanced_security               = optional(string, "enabled")
      secret_scanning                 = optional(string, "enabled")
      secret_scanning_push_protection = optional(string, "enabled")
    }), null)

    template = optional(object({
      owner                = string
      repository           = string
      include_all_branches = optional(bool, false)
    }), null)
  })
}

variable "repo_labels" {
  type = map(object({
    color       = string
    description = optional(string)
  }))

  default = {}
}

variable "repo_actions_variables" {
  // Key is the variable name
  type    = map(string)
  default = {}
}

variable "repo_branch_protections" {
  type = map(object({
    // Key is just an identifier
    pattern                         = optional(string, "main")
    enforce_admins                  = optional(bool, true)
    require_signed_commits          = optional(bool, true)
    required_linear_history         = optional(bool, true)
    require_conversation_resolution = optional(bool, true)
    push_restrictions               = optional(list(string), null)
    force_push_bypassers            = optional(list(string), null)
    allows_deletions                = optional(bool, false)
    allows_force_pushes             = optional(bool, false)
    blocks_creations                = optional(bool, false)
    lock_branch                     = optional(bool, false)

    required_status_checks = optional(object({
      strict   = optional(bool, true)
      contexts = optional(string, null)
    }), null)

    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = optional(bool, false)
      restrict_dismissals             = optional(bool, true)
      dismissal_restrictions          = optional(string, null)
      pull_request_bypassers          = optional(string, null)
      require_code_owner_reviews      = optional(bool, true)
      required_approving_review_count = optional(number, 0)
      require_last_push_approval      = optional(bool, true)
    }), null)
  }))

  default = {}
}

variable "repo_tag_protection" {
  type = map(string)

  default = {}
}
