# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/poseidon/terraform-render-bootkube.git?ref=533e82f833c166297abd249ac3d4853d6ebed364"

  cloud_provider = "${var.cloud_provider}"
  cluster_name = "${var.cluster_name}"
  api_servers  = ["${format("%s.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers = ["${aws_route53_record.etcds.*.fqdn}"]
  asset_dir    = "${var.asset_dir}"
  networking   = "${var.networking}"
  network_mtu  = "${var.network_mtu}"
  pod_cidr     = "${var.pod_cidr}"
  service_cidr = "${var.service_cidr}"
}
