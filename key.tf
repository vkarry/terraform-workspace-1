resource "aws_key_pair" "terrakey" {
  key_name   = "terrakey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
