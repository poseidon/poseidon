output "kubeconfig-admin" {
  value     = module.bootstrap.kubeconfig-admin
  sensitive = true
}

# Outputs for Kubernetes Ingress

output "controllers_dns" {
  value = digitalocean_record.controllers[0].fqdn
}

output "workers_dns" {
  # Multiple A and AAAA records with the same FQDN
  value = digitalocean_record.workers-record-a[0].fqdn
}

output "controllers_ipv4" {
  value = digitalocean_droplet.controllers.*.ipv4_address
}

output "controllers_ipv6" {
  value = digitalocean_droplet.controllers.*.ipv6_address
}

output "workers_ipv4" {
  value = digitalocean_droplet.workers.*.ipv4_address
}

output "workers_ipv6" {
  value = digitalocean_droplet.workers.*.ipv6_address
}

# Outputs for worker pools

output "kubeconfig" {
  value     = module.bootstrap.kubeconfig-kubelet
  sensitive = true
}

# Outputs for custom firewalls

output "controller_tag" {
  description = "Tag applied to controller droplets"
  value       = digitalocean_tag.controllers.name
}

output "worker_tag" {
  description = "Tag applied to worker droplets"
  value       = digitalocean_tag.workers.name
}

# Outputs for custom load balancing

output "vpc_id" {
  description = "ID of the cluster VPC"
  value       = digitalocean_vpc.network.id
}

# Outputs for debug

output "assets_dist" {
  value     = module.bootstrap.assets_dist
  sensitive = true
}

