resource "aws_instance" "mod-1" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = "binary"
  user_data     = <<-EOF
#!/bin/bash
apt update --fix-missing
apt install -y nginx
systemctl start nginx
systemctl enable nginx
chmod 0777 /var/www/html/index.nginx-debian.html
echo "<html><h1>Hello from your web server!</h1></html>" > /var/www/html/index.nginx-debian.html
systemctl start nginx
EOF


}
