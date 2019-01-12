resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}

resource "aws_eip" "nat-gw" {
  vpc      = true
}