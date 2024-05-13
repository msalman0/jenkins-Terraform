# EC2 instance creation
resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  user_data = <<-EOF
    #!/bin/bash
    # Install Jenkins
    sudo yum update -y
    sudo yum install -y java-1.8.0-openjdk-devel
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
  EOF

  provisioner "remote-exec" {
    inline = [
      "sleep 60",  # Wait for Jenkins to start
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword > /tmp/initialAdminPassword"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}

output "public_ip" {
  value = aws_instance.jenkins.public_ip
}
