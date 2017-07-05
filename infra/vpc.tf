/*
This is a VPC. It's mandatory field is cidr_block.
So the first 16 bits are fixed and the last 16 can change. Meaning 2^16 i.e. 65536 address spaces are available. See example below
a.b.0.0 / 16  +0.0.255.255  255.255.0.0 65,536  216 256 C = B 

You can't change the size of a VPC after you create it.
*/
resource "aws_vpc" "raj_tf" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags {
    Name = "raj_tf"
  }
}


/*
Only one Internet gateway can be attached to a VPC at a time.
*/
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