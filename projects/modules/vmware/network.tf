variable "datacenter" {
  default = "LAB"
}

variable "cluster" {
  default = "HABACATES"
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "${var.cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_resource_pool" "resource_pool" {
  name                    = "terraform-resource-pool-test"
  parent_resource_pool_id = "${data.vsphere_compute_cluster.compute_cluster.resource_pool_id}"
}
