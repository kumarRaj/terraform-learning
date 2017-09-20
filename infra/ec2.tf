// If we do not specify security group i still can't connect to a public box with a public ip
resource "aws_instance" "raj_public_box" {
  ami           = "ami-30041c53"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.raj_public_tf.id}"
  associate_public_ip_address = true
  key_name = "raj"
  security_groups = ["${aws_security_group.allow_ssh_from_my_ip.id}"]

  tags {
    Name = "raj_public_subnet_instance"
  }
}

resource "aws_instance" "raj_public_box_without_default_public_ip" {
  ami           = "ami-30041c53"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.raj_public_tf.id}"
//  If this flag is not set I can't access it directly. I can ssh into a box with public ip and then ssh into
//  this box. For now both lie in the same instance
  associate_public_ip_address = false
  key_name = "raj"

  tags {
    Name = "raj_public_subnet_instance_without_public_ip"
  }
}

