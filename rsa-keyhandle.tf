#creating rsa based 4096 key pair
resource "tls_private_key" "rsa-4096-example" {
  algorithm = var.private-key-algo
  rsa_bits  = var.key-size
}

#save my private key
resource "local_file" "my_output_file-2" {
  content    = tls_private_key.rsa-4096-example.private_key_pem
  filename   = "${path.module}/myKey.pem"
  depends_on = [aws_instance.example]
  file_permission = 0400
}

#sending public key to aws cloud account 
resource "aws_key_pair" "deployer" {
  key_name   = "gsk-private-key"
  public_key = var.ec2-key-name
}