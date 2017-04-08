output "public_ip" {
  value = "${aws_instance.demo.public_ip}"
}
