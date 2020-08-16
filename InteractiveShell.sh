#Getting a Shell Inside Containers: No Need for SSH
echo "start new container interactively"
sudo docker container run -it  
echo "run additional commands in existing containers"
sudo docker container exec -it       
sudo docker container run -it --name proxy nginx bash
echo "Type exit to stop"

