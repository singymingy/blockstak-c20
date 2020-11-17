
resource "aws_security_group" "nodes_sg" {
  name        = "Access Policy"
  description = "Allow p2p traffic from internet and ssh / web from myIP"

  ingress {
    description = "Lb web port  access from myIP"
    from_port   = var.lbweb_port
    to_port     = var.lbweb_port
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  ingress {
    description = "p2p port - 20444 access from internet"
    from_port   = var.p2p_port
    to_port     = var.p2p_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "port 22 from myIP"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  ingress {
    description = "port 20443 - access within lb local subnet"
    from_port   = var.web_port
    to_port     = var.web_port
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nodes_sg"
  }
}
