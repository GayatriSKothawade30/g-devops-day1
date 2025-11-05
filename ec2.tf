
# creating ec2 vm 
resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  ami           = var.gsk-ami-id
  instance_type = var.vm-size
  key_name      = aws_key_pair.deployer.key_name
  tags = {
    "Name" : var.vm-name
  }

}

