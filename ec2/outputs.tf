output "public_IP" {
  value = aws_instance.example.*.public_ip

}

# creating ansible inventory like file 
resource "null_resource" "stop_ipaddress" {
  depends_on = [ aws_instance.example ]
  provisioner "local-exec" {
    command = <<EOT
      echo "[hello]" > "${path.module}/../Ansible/Inventory"
      echo "${join("\n",aws_instance.example[*].public_ip)}" >> "${path.module}/../Ansible/Inventory"
      EOT   
  }
  
}