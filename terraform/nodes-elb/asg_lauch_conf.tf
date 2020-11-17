resource aws_launch_configuration "my-asg-launch-conf" {
  name            = "blockstack-nodes"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.nodes_sg.id]
  key_name        = "tf-aws"

  user_data = <<-EOF
      #!/bin/bash
      sudo docker run -d --name singymingy_blockstack --rm -e RUST_BACKTRACE="full" -e BLOCKSTACK_DEBUG="1" -p 20443:20443 -p 20444:20444 blockstack/stacks-blockchain:latest /bin/stacks-node krypton
EOF  
}
