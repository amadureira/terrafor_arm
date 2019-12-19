data "vsphere_datacenter" "datacenter" {
  name = "LAB"

}

resource "vsphere_resource_pool" "pool" {
# count         = 1
  name          = "teste"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}
