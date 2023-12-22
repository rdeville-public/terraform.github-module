# locals {
#   repos = {
#     for repo_key, repo_value in var.repos : repo_key => merge(
#       var.repos_config,
#       repo_value
#     )
#   }
# }

# locals {
#   repos_labels = flatten([
#     for repo_key, repo_value in var.repos : [
#       for label_key, label_value in merge(repo_value.labels, var.repos_labels) : {
#         repository  = github_repository.this[repo_key].name
#         name        = label_key
#         color       = label_value.color
#         description = label_value.description
#       }
#     ]
#   ])
# }

# locals {
#   repos_actions_variables = flatten([
#     for repo_key, repo_value in var.repos : [
#       for variable_key, variable_value in merge(repo_value.actions_variables, var.repos_actions_variables) : {
#         repository = github_repository.this[repo_key].name
#         name       = variable_key
#         value      = variable_value
#       }
#     ]
#   ])
# }

# locals {
#   repos_branch_protection = flatten([
#     for repo_key, repo_value in var.repos : [
#       merge(
#         repo_value.branch_protection,
#         var.repos_branch_protection,
#         {
#           repository = github_repository.this[repo_key].name
#         }
#       )
#     ]
#   ])
# }

# locals {
#   repos_tag_protection = flatten([
#     for repo_key, repo_value in var.repos : [
#       for tag_protections_key, tag_protections_value in merge(repo_value.tag_protection, var.repos_tag_protection) : {
#         repository  = github_repository.this[repo_key].name
#         name        = tag_protections_key
#         color       = tag_protections_value.color
#         description = tag_protections_value.description
#       }
#     ]
#   ])
# }
