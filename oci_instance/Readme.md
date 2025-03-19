# OCI: Performing a creation of instances
This terraform project will be to able to create the below cloud architecture in OCI

![alt text](image.png)




One of the requirements before beginning to build an instance is to create a ssh key. This key allow us to maintain a connection with our instance once it have been created

To performance the creation of the ssh key is necessary to open a terminal o git bash if you use windows, then type the following command
remmenber to replace the name of the key.

```sh
ssh-keygen -t rsa -N "" -b 2048 -C <your-ssh-key-name> -f <your-ssh-key-name>
```

# Notes

To avoid the next error form oversize characters in the label parameter, this must be to have a size between 1 and 15 charaters

```sh 
 Error: 400-InvalidParameter, dnsLabel size must be between 1 and 15
│ Suggestion: Please update the parameter(s) in the Terraform config as per error message dnsLabel size must be between 1 and 15
```

```sh
resource "oci_core_virtual_network" "TestTerrafomrLabVNC" {
  cidr_block = "10.0.0.0/16"
  dns_label  = "a"  # dnsLabel size must be between 1 and 15 charaters
}
```


