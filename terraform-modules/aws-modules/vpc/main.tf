provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "gurus_webserver" {
  # AC: Reference your other module via the Spacelift module registry
  source  = "spacelift.io/adamconnelly/aa-dev/gururaj"
  version = "0.0.1"

  vpc_id         = aws_vpc.main.id
  cidr_block     = "10.0.0.0/16"
  webserver_name = "Guru"
  ami            = "ami-08e4e35cccc6189f4"
  instance_type  = "t2.micro"
}
