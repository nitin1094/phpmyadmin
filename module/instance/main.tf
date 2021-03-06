resource "aws_instance" "nitin" {
  ami           =  var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name = var.key
   #key_name = "ongraph-new"

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
      #key_name = "ongraph-new"
      host = aws_instance.nitin.public_ip
    }
  }

  provisioner "file" {
    source      = "script"
    destination = "/tmp/script"
    connection {
    type     = "ssh"
    user     = var.ssh_user
    private_key = file(var.private_key_path)
    #key_name = "ongraph-new"
    host     = aws_instance.nitin.public_ip
  }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script/script.sh",
      "/tmp/script/script.sh",
    ]
    connection {
      type = "ssh"
      user = var.ssh_user
      private_key = file(var.private_key_path)
      #key_name = "ongraph-new"
      host = aws_instance.nitin.public_ip
    }
  }
}

output "aws_ip" {
  value = aws_instance.nitin.public_ip
}
