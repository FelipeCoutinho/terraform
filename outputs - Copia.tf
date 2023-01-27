output "ips" {
  value = "${aws_instance.dev.resource.public_ip}"
}

// terraform refresh  -faz o reload