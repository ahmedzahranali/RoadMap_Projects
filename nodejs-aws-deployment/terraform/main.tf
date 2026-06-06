data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "deployer_key" {
  key_name = "terraform-ansible-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "ec2_sg" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "roadmap_iac_ec2" {
  ami = data.aws_ami.ubuntu.id
  key_name = aws_key_pair.deployer_key.key_name
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}
