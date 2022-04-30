resource "openstack_blockstorage_volume_v3" "volume" {
  name                 = "volume-for-${var.name_instance}"
  size                 = var.hdd_size
  image_id             = var.image_id
  volume_type          = var.volume_type
  availability_zone    = var.az_zone
  enable_online_resize = true

  lifecycle {
    ignore_changes = [image_id]
  }
}