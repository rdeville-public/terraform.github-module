output "ssh_url" {
  value = github_repository.this.ssh_clone_url
}

output "http_url" {
  value = github_repository.this.http_clone_url
}

output "path_with_namespace" {
  value = github_repository.this.full_name
}
