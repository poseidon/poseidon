variable "cluster_name" {
  type        = string
  description = "Unique cluster name (prepended to dns_zone)"
}

variable "default_tags" {
  type = map(string)
  description = "list of default AWS resources tags"
  default = {}
}

# AWS

variable "dns_zone" {
  type        = string
  description = "AWS Route53 DNS Zone (e.g. aws.example.com)"
}

variable "dns_zone_id" {
  type        = string
  description = "AWS Route53 DNS Zone ID (e.g. Z3PAABBCFAKEC0)"
}

# instances

variable "controller_count" {
  type        = number
  description = "Number of controllers (i.e. masters)"
  default     = 1
}

variable "worker_count" {
  type        = number
  description = "Number of workers"
  default     = 1
}

variable "controller_type" {
  type        = string
  description = "EC2 instance type for controllers"
  default     = "t3.small"
}

variable "worker_type" {
  type        = string
  description = "EC2 instance type for workers"
  default     = "t3.small"
}

variable "os_image" {
  type        = string
  description = "AMI channel for a Container Linux derivative (coreos-stable, coreos-beta, coreos-alpha, flatcar-stable, flatcar-beta, flatcar-alpha, flatcar-edge)"
  default     = "flatcar-stable"
}

variable "disk_size" {
  type        = number
  description = "Size of the EBS volume in GB"
  default     = 40
}

variable "disk_type" {
  type        = string
  description = "Type of the EBS volume (e.g. standard, gp2, io1)"
  default     = "gp2"
}

variable "disk_iops" {
  type        = number
  description = "IOPS of the EBS volume (e.g. 100)"
  default     = 0
}

variable "worker_price" {
  type        = number
  description = "Spot price in USD for worker instances or 0 to use on-demand instances"
  default     = 0
}

variable "worker_target_groups" {
  type        = list(string)
  description = "Additional target group ARNs to which worker instances should be added"
  default     = []
}

variable "controller_snippets" {
  type        = list(string)
  description = "Controller Container Linux Config snippets"
  default     = []
}

variable "worker_snippets" {
  type        = list(string)
  description = "Worker Container Linux Config snippets"
  default     = []
}

# configuration

variable "ssh_authorized_key" {
  type        = string
  description = "SSH public key for user 'core'"
}

variable "networking" {
  type        = string
  description = "Choice of networking provider (calico or flannel)"
  default     = "calico"
}

variable "network_mtu" {
  type        = number
  description = "CNI interface MTU (applies to calico only). Use 8981 if using instances types with Jumbo frames."
  default     = 1480
}

variable "host_cidr" {
  type        = string
  description = "CIDR IPv4 range to assign to EC2 nodes"
  default     = "10.0.0.0/16"
}

variable "pod_cidr" {
  type        = string
  description = "CIDR IPv4 range to assign Kubernetes pods"
  default     = "10.2.0.0/16"
}

variable "service_cidr" {
  type        = string
  description = <<EOD
CIDR IPv4 range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for coredns.
EOD
  default     = "10.3.0.0/16"
}

variable "enable_reporting" {
  type        = bool
  description = "Enable usage or analytics reporting to upstreams (Calico)"
  default     = false
}

variable "enable_aggregation" {
  type        = bool
  description = "Enable the Kubernetes Aggregation Layer (defaults to false)"
  default     = false
}

variable "worker_node_labels" {
  type        = list(string)
  description = "List of initial worker node labels"
  default     = []
}

# unofficial, undocumented, unsupported

variable "asset_dir" {
  type        = string
  description = "Absolute path to a directory where generated assets should be placed (contains secrets)"
  default     = ""
}

variable "cluster_domain_suffix" {
  type        = string
  description = "Queries for domains with the suffix will be answered by CoreDNS. Default is cluster.local (e.g. foo.default.svc.cluster.local)"
  default     = "cluster.local"
}

