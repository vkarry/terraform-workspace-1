resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.terrakey.key_name}"

  # VPC Subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  #ROle
  iam_instance_profile = "${aws_iam_instance_profile.s3-bucket-role-instanceprofile.name}"
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"

  tags {
    Name = "extra-ebs-volume"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.example.id}"
}

output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}
