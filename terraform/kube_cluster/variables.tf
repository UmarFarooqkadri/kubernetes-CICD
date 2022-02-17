variable "prevent_destroy" {
  type        = string
  default     = true
}

variable "project_id" {
  type = string
}

variable "cluster_name" {
  type = string
  default = true
}


variable "auto_upgrade" {
  type        = string
  default     = true
  description = "Whether the nodes will be automatically upgraded."
}

variable "auto_repair" {
  type        = string
  default     = true
  description = "Whether the nodes will be automatically repaired."
}



variable "preemptible_compute" {
  type        = string
  default     = true
  description = "Set the underlying node VMs are preemptible. Not recommended for production workloads."
}

variable "disable_horizontal_pod_autoscaling" {
  type        = string
  default     = false
  description = "Horizontal Pod Autoscaling addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods."
}

variable "disable_http_load_balancing" {
  type        = string
  default     = false
  description = "The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster. It is enabled by default"
}

variable "disable_network_policy_config" {
  type        = string
  default     = true
  description = "Whether we should enable the network policy addon for the master. This must be enabled in order to enable network policy for the nodes. It can only be disabled if the nodes already do not have network policies enabled."
}

variable "min_node_count" {
  type    = string
  default = 5
}

variable "max_node_count" {
  type    = string
  default = 10
}

variable "region" {
  type    = string
  default = "australia-southeast1"
}

variable "custom_zone" {
  type    = string
  default = "us-central1-c"
}

variable "is_custom_zone" {
  type    = string
  default = "false"
}

variable "second_nodepool" {
  type    = string
  default = "false"
}

