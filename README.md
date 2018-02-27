# docker-as-vm
Run as many docker instances as you want with simple scripts and automatic configurations scripts
to let users access ressources of your server

## More details
This docker image creates ssh access (useful to manage an instance) and opens a port (80).
In my case I use it for http but you can use it for another service.

## Installation
### First steps
Prepare your server ...
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

## In the future (todo list)

Read PORTS file and add automatically to docker wanted ports associated with subdomains name-servicename.domain.com
