output "public_IP" {
  value = aws_instance.example.*.public_ip

}

resource "local_file" "Inventory" {
   content  = jsonencode(aws_instance.example.*.public_ip)
   filename = "${path.module}/../Ansible/Inventory"
}