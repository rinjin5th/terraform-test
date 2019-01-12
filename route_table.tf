resource "aws_internet_gateway" "iguwo-test" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "iguwo-test"
  }
}

resource "aws_nat_gateway" "iguwo-test" {
  allocation_id = "${aws_eip.nat-gw.id}"
  subnet_id     = "${aws_subnet.iguwo-test-public.0.id}"
}

resource "aws_route_table" "iguwo-test-public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.iguwo-test.id}"
  }

  tags = {
    Name = "iguwo-test-public"
  }
}

resource "aws_route_table" "iguwo-test-private" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.iguwo-test.id}"
  }

  tags = {
    Name = "iguwo-test-public"
  }
}

resource "aws_route_table_association" "iguwo-test-public" {
  subnet_id      = "${aws_subnet.iguwo-test-public.0.id}"
  route_table_id = "${aws_route_table.iguwo-test-public.id}"
}

resource "aws_route_table_association" "iguwo-test-private" {
  count = 2 
  subnet_id      = "${element(aws_subnet.iguwo-test-private.*.id, count.index)}"
  route_table_id = "${aws_route_table.iguwo-test-private.id}"
}