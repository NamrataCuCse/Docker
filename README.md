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

#### Create new Image with given Network
```bash
sudo docker container run -d --name new_nginx --network my-net nginx
```
#### Inspect the Network 
```bash 
sudo docker network inspect my-net
```
New nginx is added.


## Docker Image
An image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime.
Repositories - https://github.com/docker-library/official-images
             		https://hub.docker.com/
Download different version than the latest
```bash
sudo docker pull nginx:1.11.9
```
Docker image history shows layers of changes made in image.
```bash
sudo docker history nginx:\latest
```
Image Tagging and Pushing to Docker Hub. Assign one or more tags to an image.
```bash
sudo docker image tag nginx <tagname/nginx>
sudo docker login
sudo docker image push <tagname/nginx>
```


## Build Your Own Dockerfile and Run Container

1. Write the script inside dockerfile for building images:
``bash 
vim dockerfile
```

2. Tag the image:

```bash
sudo docker build -t testnode .
```
Where
-t == tag
. = current directory

3. Run the image:
```bash
sudo docker container run --rm -p 80:3000 testnode
```
4. Upload to dockerhub:
```bash
sudo docker tag testnode namratacucse/test-node
sudo docker push namratacucse/test-node
```
5.Remove the image (optional):
```bash
sudo docker image rm namratacucse/test-node
```
6.To restart again (optional):
```bash
sudo docker container run --rm -p 80:3000 namratacucse/test-node
```
Goto localhost.

## Prune to Keep Docker System Clean
You can use "prune" commands to clean up images, volumes, build cache, and containers. 
1. Clean up just "dangling" images ***docker image prune***
2. Clean up everything docker ***system prune***

## Stop and remove all docker containers and images
1. List all containers (only IDs) ***docker ps -aq***
2. Stop all running containers ***docker stop $(docker ps -aq)***
3.Remove all containers  ***docker rm $(docker ps -aq)***
4.Remove all images ***docker rmi $(docker images -q)***
