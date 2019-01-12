

resource "aws_network_interface" "web" {
  count = 2
  subnet_id       = "${element(aws_subnet.iguwo-test-private.*.id, count.index)}"
  private_ips     = ["${element(var.web-private-ip-addresses, count.index)}"]
  security_groups = ["${aws_security_group.web.id}"]

  attachment {
    instance     = "${element(aws_instance.web.*.id, count.index)}"
    device_index = 1
  }
}