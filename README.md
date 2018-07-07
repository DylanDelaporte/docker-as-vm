# docker-as-vm

This set of scripts let you deploy easily docker instances with your own automatic configurations scripts. Also there are scripts that handle public development of an instance.

Configuration files let you associate a subdomain to a service inside the docker
For example if you want you can edit the `config/ports` file and then add the line `22 ssh`

You will have to add features in a script to automatically add sub-domains (a default script has been added for bind)

When you create your docker instance you will have access to the ssh service by <name-of-the-instance>-ssh.domain.com

## Requirements

- Docker
- Apache server (optional)
- 80 port opened (optional)
- A DN (optional)

## Installation
### First steps
Setup your server ...
~~~~
git clone https://github.com/DylanDelaporte/docker-as-vm.git
cd docker-as-vm
chmod +x configure_host.sh
./configure_host.sh
~~~~

### Create instances
~~~~
chmod +x create_docker.sh
./create_docker.sh "name"
~~~~

## Alpha version

This project is in development so there could be bugs, feel free to open an issue or create a pull request :)

