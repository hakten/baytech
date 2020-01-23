data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS ENA*"]
  }

  owners = ["679593333241"]
}

resource "aws_instance" "nagios" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Project = "atech"
  }
}

output "aws_instance-nagios-public_ip" {
  value = aws_instance.nagios.public_ip
}