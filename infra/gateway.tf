resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "private" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.raj_public_tf.id}"
}



