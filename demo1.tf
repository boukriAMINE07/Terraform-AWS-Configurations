variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  alias      = "useast1"
}

resource "aws_instance" "us-west-2" {
  ami           = "ami-07d07d65c47e5aa90"
  instance_type = "t2.micro"
}
resource "aws_instance" "us-east-1" {
  ami           = "ami-041feb57c611358bd"
  instance_type = "t2.micro"
  provider      = aws.useast1
}
resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "s3-terraform-bucket-boukri-2707"
  tags = {
    Name        = "My terraform bucket"
    Environment = "Dev-Env"
  }
}
resource "aws_vpc" "dev" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}
resource "aws_subnet" "sub" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-subnet"
  }
}
resource "aws_db_instance" "projectdb" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}


