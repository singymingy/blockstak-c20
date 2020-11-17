resource "aws_instance" "test-instance" {
  ami                    = var.ami
  count                  = 3
  instance_type          = var.instance_type
  key_name               = "tf-aws"
  vpc_security_group_ids = [aws_security_group.nodes_sg.id] #Interpolation to place variable value
  tags = {
    Name = "validator-node-${count.index}"
  }

  user_data = <<-EOF
      #!/bin/bash
      sudo docker run -d --name stacks_follower --rm -e RUST_BACKTRACE="full" -e BLOCKSTACK_DEBUG="1" -p 20443:20443 -p 20444:20444 blockstack/stacks-blockchain:latest /bin/stacks-node krypton
EOF
}
