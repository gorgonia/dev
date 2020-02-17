data "aws_ami" "dlami_ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["Deep Learning AMI (Ubuntu)*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

// ------------- Resources ------------------

resource "aws_instance" "dev" {
  ami               = data.aws_ami.dlami_ubuntu.id
  instance_type     = "g3s.xlarge"
  key_name          = var.keyName
  availability_zone = "us-east-1d"

  tags = {
    Name = "dev"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_default_vpc.default.id}"
  ingress {
    # TLS (change to whatever ports you need)
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = [var.ssh_authorized_ip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
// ------------- Variables ------------------

variable "ssh_authorized_ip" {
    type = string
    description = "The IP of your machine /32 (0.0.0.0/0 is not a good idea)"
}

variable "keyName" {
  type = string
  description = "the ssh key name (see https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair)"
}

variable "region" {
  default = "us-east-1"
}

// ------------- Output ------------------

output "instance_ip_addr" {
  value = aws_instance.dev.public_ip
}

provider "aws" {
  region     = var.region
}