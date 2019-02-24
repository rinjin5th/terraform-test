

resource "aws_instance" "bastion" {
  ami           = "ami-0bab560bf1ee352f5"
  instance_type = "t2.micro"
  key_name = "iguwo-test-key"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id = "${aws_subnet.iguwo-test-public.0.id}"

  tags = {
    Name = "iguwo-test-bastion"
  }
}

resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0b5447e1d0005092a"
  instance_type = "t2.micro"
  key_name = "iguwo-test-key"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  subnet_id = "${element(aws_subnet.iguwo-test-private.*.id, count.index)}"

  tags = {
    Name = "${format("iguwo-test-web%02d", count.index + 1)}"
  }
}
