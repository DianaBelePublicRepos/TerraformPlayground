
terraform {
  backend "s3" {
    bucket  = "terraform-up-and-running-state-diana-27nov2019"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "instanceguineepig2" {
  ami                    = "ami-40d28157"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.securitygroupguineepig2.id}"]

  user_data = <<-EOF
                           #!/bin/bash
                           echo "We just want to see the world burn" > index.html
                           nohup busybox httpd -f -p 8080 &
                           EOF

  tags = {
    Name        = "Guinee Pig Server 2"
    Environment = "production"
  }
}

resource "aws_security_group" "securitygroupguineepig2" {
  name = "terraform-sg-webserver2"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
