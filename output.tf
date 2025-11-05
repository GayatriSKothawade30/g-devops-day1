# public ip of my ec2 instance
output "my-ec2-publicIP" {
  value = aws_instance.example.public_ip
}

#ec2 machine instance id 
output "my-ec2ID" {
  value = aws_instance.example.id

}
resource "local_file" "my_output_file" {
  content    = aws_instance.example.public_ip
  filename   = "${path.module}/myIP.txt"
  depends_on = [aws_instance.example]
}