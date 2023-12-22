resource "github_repository" "this" {
  name         = var.repo.name
  description  = var.repo.description
  homepage_url = var.repo.homepage_url

  visibility                              = var.repo.visibility
  has_issues                              = var.repo.has_issues
  has_discussions                         = var.repo.has_discussions
  has_projects                            = var.repo.has_projects
  has_wiki                                = var.repo.has_wiki
  is_template                             = var.repo.is_template
  allow_merge_commit                      = var.repo.allow_merge_commit
  allow_squash_merge                      = var.repo.allow_squash_merge
  allow_rebase_merge                      = var.repo.allow_rebase_merge
  squash_merge_commit_title               = var.repo.squash_merge_commit_title
  squash_merge_commit_message             = var.repo.squash_merge_commit_message
  merge_commit_title                      = var.repo.merge_commit_title
  merge_commit_message                    = var.repo.merge_commit_message
  delete_branch_on_merge                  = var.repo.delete_branch_on_merge
  has_downloads                           = var.repo.has_downloads
  auto_init                               = var.repo.auto_init
  gitignore_template                      = var.repo.gitignore_template
  license_template                        = var.repo.license_template
  archived                                = var.repo.archived
  archive_on_destroy                      = var.repo.archive_on_destroy
  topics                                  = var.repo.topics
  ignore_vulnerability_alerts_during_read = var.repo.ignore_vulnerability_alerts_during_read
  allow_update_branch                     = var.repo.allow_update_branch

  dynamic "security_and_analysis" {
    for_each = var.repo.security_and_analysis != null ? [1] : []

    content {
      advanced_security {
        status = try(var.repo.security_and_analysis.advanced_security, "enabled")
      }
      secret_scanning {
        status = try(var.repo.security_and_analysis.secret_scanning, "enabled")
      }
      secret_scanning_push_protection {
        status = try(var.repo.security_and_analysis.secret_scanning_push_protection, "enabled")
      }
    }
  }


  dynamic "template" {
    for_each = can(var.repo.tempate) ? [1] : []

    content {
      owner                = try(var.repo.template.owner, null)
      repository           = try(var.repo.template.repository, null)
      include_all_branches = try(var.repo.template.include_all_branches, null)
    }
  }

  dynamic "pages" {
    for_each = can(var.repo.pages) ? [1] : []

    content {
      build_type = try(var.repo.pages.build_type, null)
      cname      = try(var.repo.pages.cname, null)

      dynamic "source" {
        for_each = can(var.repo.source) ? [1] : []

        content {
          branch = var.repo.source.branch
          path   = var.repo.source.path
        }
      }
    }
  }
}

resource "github_issue_label" "this" {
  for_each = var.repo_labels

  repository  = github_repository.this.id
  name        = each.key
  color       = each.value.color
  description = each.value.description

}

resource "github_actions_variable" "this" {
  for_each = var.repo_actions_variables

  repository    = github_repository.this.id
  variable_name = each.key
  value         = each.value.value
}

resource "github_branch_protection" "this" {
  for_each = var.repo_branch_protections
  // Key is just an identifier
  repository_id                   = github_repository.this.id
  pattern                         = each.value.pattern
  enforce_admins                  = each.value.enforce_admins
  require_signed_commits          = each.value.require_signed_commits
  required_linear_history         = each.value.required_linear_history
  require_conversation_resolution = each.value.require_conversation_resolution
  push_restrictions               = each.value.push_restrictions
  force_push_bypassers            = each.value.force_push_bypassers
  allows_deletions                = each.value.allows_deletions
  allows_force_pushes             = each.value.allows_force_pushes
  blocks_creations                = each.value.blocks_creations
  lock_branch                     = each.value.lock_branch
  dynamic "required_status_checks" {
    for_each = each.value.required_status_checks != null ? [1] : []
    content {
      strict   = each.value.required_status_checks.strict
      contexts = each.value.required_status_checks.contexts
    }
  }
  dynamic "required_pull_request_reviews" {
    for_each = each.value.required_pull_request_reviews != null ? [1] : []
    content {
      dismiss_stale_reviews           = each.value.required_pull_request_reviews.dismiss_stale_reviews
      restrict_dismissals             = each.value.required_pull_request_reviews.restrict_dismissals
      dismissal_restrictions          = each.value.required_pull_request_reviews.dismissal_restrictions
      pull_request_bypassers          = each.value.required_pull_request_reviews.pull_request_bypassers
      require_code_owner_reviews      = each.value.required_pull_request_reviews.require_code_owner_reviews
      required_approving_review_count = each.value.required_pull_request_reviews.required_approving_review_count
      require_last_push_approval      = each.value.required_pull_request_reviews.require_last_push_approval
    }
  }
}

resource "github_repository_tag_protection" "this" {
  for_each = var.repo_tag_protection

  repository = github_repository.this.name
  pattern    = each.value.pattern


}
