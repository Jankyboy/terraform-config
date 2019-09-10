variable "project_name" {
  default = "Staging Services 1"
}

variable "project_id" {
  default = "travis-ci-staging-services-1"
}

variable "region" {
  default = "us-central1"
}

variable "node_pool_tags" {
  type    = "list"
  default = ["services"]
}