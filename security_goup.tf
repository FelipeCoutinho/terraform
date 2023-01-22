// 
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh Allow TLS inbound traffic"

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["163.116.228.72/32"] // ip da minha maquina local , ips permitidos
  }

  tags = {
    Name = "ssh"
  }
}

// 
resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = "aws.us-east-2"
  name        = "acesso-ssh"
  description = "acesso-ssh Allow TLS inbound traffic"

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["163.116.228.72/32"] // ip da minha maquina local , ips permitidos
  }

  tags = {
    Name = "ssh"
  }
}