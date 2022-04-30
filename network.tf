resource "openstack_networking_port_v2" "port" {
  name       = "${var.name_instance}-eth0"
  network_id = var.network_id

  fixed_ip {
    subnet_id = var.subnet_id
    ip_address   = var.fixed_ip
  }
}