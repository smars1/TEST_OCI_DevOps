One of the requirements before beginning to build an instance is to create a ssh key. This key allow us to maintain a connection with our instance once it have been created

To performance the creation of the ssh key is necessary to open a terminal o git bash if you use windows, then type the following command
remmenber to replace the name of the key.

```sh
ssh-keygen -t rsa -N "" -b 2048 -C <your-ssh-key-name> -f <your-ssh-key-name>
```