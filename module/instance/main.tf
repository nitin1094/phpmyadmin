resource "aws_instance" "adarsh" {
  ami           =  var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name = var.key

  tags = {
    Name = "dev"
    Environment = "${var.environment}"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait, Until SSH is Ready'"]
    connection {
      type = "ssh"
      user = var.ssh_user
      private_key = file(var.private_key_path)
      host = aws_instance.adarsh.public_ip
    }
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
    type     = "ssh"
    user     = var.ssh_user
    private_key = file(var.private_key_path)
    host     = aws_instance.adarsh.public_ip
  }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
    connection {
      type = "ssh"
      user = var.ssh_user
      private_key = file(var.private_key_path)
      host = aws_instance.adarsh.public_ip
    }
  }
}

output "aws_ip" {
  value = aws_instance.adarsh.public_ip
}