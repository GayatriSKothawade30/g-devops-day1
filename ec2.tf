
# creating ec2 vm 
resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  ami           = var.gsk-ami-id
  instance_type = var.vm-size
  key_name      = aws_key_pair.deployer.key_name
  tags = {
    "Name" : var.vm-name
  }

#provisioner

  provisioner "remote-exec"{
    inline = [
      "sudo dnf install git httpd -y",
      "mkdir -p hello/terraform"
    ]

}

connection {
 type = "ssh"
 user = "ec2-user"
 host = self.public_ip
 #content of private key data
 private_key = tls_private_key.rsa-4096-example.private_key_pem
 timeout = "5m"
}

}



