# Docker

## Docker Create and Start
```bash
sudo docker create --name nginx_base -p 80:80 nginx:alpine
sudo docker start nginx_base
```
Parameters:
1. -p == --publish the port
2. -d == --detach tells docker to run the image it the background.
By running in detached mode, we are able to have access to our command line when the container spins up and runs. Without it, we would have logs constantly fed onto the screen.
3. -e -> environment variable.
Once you run the command, you will get output if you browse to the URL http://dockerhost:8080.


## Docker Pull and Run
```bash
docker pull nginx
sudo docker run --publish 8080:80 --detach nginx
```
Docker run is the equivalent of executing docker create followed by docker start. The -d option tells Docker to run the container detached so to get command prompt back.

## List of all container
```bash 
sudo docker container ls -a  
```
Parameter:
1. -a = active

## Remove a Container
```bahs
sudo docker container stop <container id>
sudo docker rm <container id>
```
Force remove 
```bash
sudo docker rm -f <container id>
```
## Get list of processes running inside a Docker Container
```bash
sudo docker top <container name>
```

## Docker Network
Commands: 
1. Show network **docker network ls**
2. Inspect network **docker network inspect**
3. Create network **docker network create --driver**
4. Attach a network to container **docker network connect**
5. Detach a network from container **docker network disconnect**

#### Check Network Status
```bash
sudo docker container inspect --format '{{.NetworkSettings.IPAddress}}' webhost
 sudo docker network ls  #show networks
```
#### Create new Network
```bash
sudo docker network create my-net
```
Network driver provides extension for virtual network.

### Create new Image with given Network
```bash
sudo docker container run -d --name new_nginx --network my-net nginx
```
### Inspect the Network 
```bash 
sudo docker network inspect my-net
```
New nginx is added.


## Docker Image
