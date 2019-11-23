
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami                    = "ami-40d28157"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
                           #!/bin/bash
                           echo "Hello World" > index.html
                           nohup busybox httpd -f -p "${var.server_port}" &
                           EOF

  tags = {
    Name        = "Guinee Pig Server 1"
    Environment = "production"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-sg-name-initialSG"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Custom SG for Web Server"
    Environment = "production"
  }

}

output public_ip {
  value = "${aws_instance.example.public_ip}"
}

output sg_id {
  value = "${aws_security_group.instance.id}"
}
