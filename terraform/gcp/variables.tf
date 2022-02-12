variable "project_id" {
  description = "The project ID to host the cluster in"
  type = string
}

variable "name" {
  description = "Name to use on all resources created (VPC, RDS, etc)"
  type        = string
  default     = "cloudquery"
}

variable "zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["us-central1-a"]
}