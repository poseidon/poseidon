# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/poseidon/terraform-render-bootkube.git?ref=c7296735631a87a0aea7841ff9c855d94aab4da4"

  cluster_name          = "${var.cluster_name}"
  api_servers           = ["${format("%s.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers          = "${digitalocean_record.etcds.*.fqdn}"
  asset_dir             = "${var.asset_dir}"
  networking            = "flannel"
  network_mtu           = 1440
  pod_cidr              = "${var.pod_cidr}"
  service_cidr          = "${var.service_cidr}"
  cluster_domain_suffix = "${var.cluster_domain_suffix}"
  enable_reporting      = "${var.enable_reporting}"
  enable_aggregation    = "${var.enable_aggregation}"
}
