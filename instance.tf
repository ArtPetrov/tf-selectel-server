resource "openstack_compute_instance_v2" "instance" {
  name              = var.name_instance
  flavor_id         = var.flavor_id
  key_pair          = var.key_pair_id
  availability_zone = var.az_zone

  network {
    port = openstack_networking_port_v2.port.id
  }

  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }

  vendor_options {
    ignore_resize_confirmation = true
  }
}
