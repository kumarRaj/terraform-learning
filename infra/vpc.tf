resource "aws_vpc" "raj_tf" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags {
    Name = "raj_tf"
  }
}


resource "aws_internet_gateway" "raj_internet_gateway_tf" {
  vpc_id = "${aws_vpc.raj_tf.id}"

  tags {
    Name = "raj_internet_gateway_tf"
  }
}

resource "aws_subnet" "raj_public_subnet_tf" {
  vpc_id     = "${aws_vpc.raj_tf.id}"
  cidr_block = "10.0.0.0/24"

  tags {
    Name = "raj_public_subnet_tf"
  }
}

resource "aws_route_table" "route_table_for_public_subnet" {
  vpc_id = "${aws_vpc.raj_tf.id}"

  route {
    cidr_block = "10.0.0.0/24"
    gateway_id = "${aws_internet_gateway.raj_internet_gateway_tf.id}"
  }

  tags {
    Name = "main"
  }
}