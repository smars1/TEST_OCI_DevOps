# Software installation within WebServer Instance
resource "null_resource" "TestTerrafomrLabWebserver1HTTPD" {
  depends_on = [oci_core_instance.TestTerrafomrLabWebserver1]
  triggers = {
    instance_id = oci_core_instance.TestTerrafomrLabWebserver1.id
  }  
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.TestTerrafomrLabWebserver1_VNIC1.public_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    inline = [
      "echo '== 1. Installing HTTPD package with dnf'",
      "sudo -u root dnf -y -q install httpd",

      "echo '== 2. Creating /var/www/html/index.html'",
      "sudo -u root touch /var/www/html/index.html",
      "sudo /bin/su -c \"echo 'Welcome to TestTerrafomrLabWebserver1.com! This is WEBSERVER1...' > /var/www/html/index.html\"",

      "echo '== 3. Disabling firewall and starting HTTPD service'",
      "sudo -u root service firewalld stop",
      "sudo -u root service httpd start"
    ]
  }
}
