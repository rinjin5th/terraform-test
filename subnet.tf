resource "aws_subnet" "iguwo-test-public" {
  count = 2
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.public-subnet-cidr-blocks, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = {
    Name = "${format("iguwo-test-public-%02d", count.index + 1)}"
  }
}

resource "aws_subnet" "iguwo-test-private" {
  count = 2
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.private-subnet-cidr-blocks, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = {
    Name = "${format("iguwo-test-private-%02d", count.index + 1)}"
  }
}