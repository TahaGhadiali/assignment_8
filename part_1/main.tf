provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami                    = "ami-0c02fb55956c7d316"  
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true

  user_data              = file("user_data.sh")

  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "Flask-Express-Instance"
  }
}

resource "aws_security_group" "sg" {
  name        = "flask-express-sg"
  description = "Allow Flask and Express traffic"

  ingress {
    from_port   = var.flask_port
    to_port     = var.flask_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.express_port
    to_port     = var.express_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
