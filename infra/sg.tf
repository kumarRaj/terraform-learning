resource "aws_security_group" "allow_all_access_from_everywhere" {
  name        = "allow_all_access_from_everywhere"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "allow_ssh_from_my_ip" {
//  Also if you fiddle with names of security groups they are recreated.
//  Also the instances associated to them are also re created
  name        = "allow_ssh_from_my_ip"
  description = "Allow ssh from specific ip"
  vpc_id = "${aws_vpc.raj_tf.id}"
//  A security group having a vpc id is a nice thing
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["171.78.144.247/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

