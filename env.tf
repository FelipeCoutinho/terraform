//tipos de variaveis
# Alternativa correta! O tipo map utiliza { } em sua declaração e contém chaves e valores.

variable "amis" {
  type = "map"

  default = {
    "us-east-1" = "ami-026c8acd92718196b"
    "us-east-2" = "ami-0d8f6eb4f641ef691"
  } 
}

variable "key_name" {
  type = "list"

  default = []
}


//como utilzar
# resource "aws_instance" "teste" {
#     ami = "${var.amis["us-east-1"]}"
#     ...
# }

# terraform destroy deleta toda a stack