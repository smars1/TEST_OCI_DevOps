# It generates Key  Pair for Webserver Instance
resource "tls_private_key" "public_private_key_pair" {
    algorithm = "RSA"
}