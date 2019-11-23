provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "instanceguineepig1" {
  ami                    = "ami-40d28157"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.securitygroupguineepig1.id}"]

  user_data = <<-EOF
                           #!/bin/bash
                           echo "Hello World" > index.html
                           nohup busybox httpd -f -p 8080 &
                           EOF

  tags = {
    Name        = "Guinee Pig Server 1"
    Environment = "production"
  }
}

resource "aws_security_group" "securitygroupguineepig1" {
  name = "terraform-sg-webserver1"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
