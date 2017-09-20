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

resource "aws_subnet" "raj_public_tf" {
  vpc_id     = "${aws_vpc.raj_tf.id}"
  cidr_block = "10.0.0.0/24"

  tags {
    Name = "raj_public_subnet_tf"
  }
}


resource "aws_subnet" "raj_private_tf" {
  vpc_id     = "${aws_vpc.raj_tf.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "raj_private_subnet"
  }
}

/*
This makes the above subnet a public subnet.
Attaching an internet gateway to a subnet's route tables makes it a public subnet
*/
resource "aws_route_table" "public_subnet" {
  vpc_id = "${aws_vpc.raj_tf.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.raj_internet_gateway_tf.id}"
  }

  tags {
    Name = "raj_public_subnet_route_table"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id = "${aws_subnet.raj_public_tf.id}"
  route_table_id = "${aws_route_table.public_subnet.id}"
}

//resource "aws_route_table" "private_subnet" {
//  vpc_id = "${aws_vpc.raj_tf.id}"
//  subnet_id = "${aws_subnet.raj_private_subnet_tf.id}"
//  route {
//    cidr_block = "0.0.0.0/0"
//    instance_id = "${aws_instance.nat.id}"
//  }
//  tags {
//    Name = "main"
//  }
//}