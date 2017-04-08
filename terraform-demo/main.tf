# ------------------------------------------------------------------------------
# CONFIGURE YOUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "${var.credentials_file}"
  profile                 = "${var.aws_profile}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "instance" {
  name = "terraform-demo-instance"

  # Inbound HTTP from anywhere
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow ssh connection
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# EXPORT YOUR PUBLIC KEY TO EC2 TO LATER USE IT TO AUTHENTICATE WITH YOUR EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_key_pair" "demo-key" {
  key_name   = "${var.ec2_key_name}"
  public_key = "${file(var.public_key_path)}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SINGLE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "demo" {
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  key_name = "${var.ec2_key_name}"

  tags {
    Name = "terraform-demo",
  }
}
