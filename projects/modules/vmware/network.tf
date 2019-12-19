data "vsphere_datacenter" "datacenter" {
  name = "LAB"

}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "HABACATES"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}


resource "vsphere_resource_pool" "pool" {
  name                    = "teste"
  parent_resource_pool_id = "${data.vsphere_compute_cluster.compute_cluster.resource_pool_id}"
}
