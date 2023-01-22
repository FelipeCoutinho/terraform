# Obijetivo: provisionar très maquina  para o time de desenvolvimento

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

//Novos recursos em diferentes regiões
provider "aws" {
  alias = "us-east-2"
  profile = "default"
  region = "us-east-2"
}


variable "instance_name" {
  description = "value of the name tag name for the ec2 instance"
  type = string
  default = "ExempleAppServiceTerraform"
}

resource "aws_instance" "dev" {
  # count = 3
  ami = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  key_name = "terraform_key_rsa.pub"
  tags = {
    "name" = var.instance_name
  }
  vpc_security_group_ids = [ "sg-05de27f1ea1285e6c" ]
}


//Maquina vinculada ao bucket
resource "aws_instance" "dev4" {
  ami = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  key_name = "terraform_key_rsa.pub"
  tags = {
    "name" = "dev4"
  }
  vpc_security_group_ids = [ "sg-05de27f1ea1285e6c" ]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  key_name = "terraform_key_rsa.pub"
  tags = {
    "name" = "dev5"
  }
  vpc_security_group_ids = [ "sg-05de27f1ea1285e6c" ] 
}


//Maquina em outra região
// Atrelada ao dynamoDb
resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"
  ami = "ami-03cf1a25c0360a382" //Microsoft Windows Server 2022 Full Locale English AMI provided by Amazon
  instance_type = "t2.micro"
  key_name = "terraform_key_rsa.pub"
  tags = {
    "name" = "dev3"
  }
  vpc_security_group_ids = [ "sg-05de27f1ea1285e6c" ]
}

#   // na aws o bucket é multiregional não especificamos em qual região ele vai ser criado
resource "aws_s3_bucket" "dev4" {
  bucket = "bkt-dev4"
  acl    = "private"

  tags = {
    Name = "bkt-dev4"
  }
}