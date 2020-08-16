#Create full distribution of linux   
echo "Create ubuntu image"
sudo docker container run -it --name ubuntu ubuntu
echo "Run ubuntu commands"
apt-get update
"Install Ubuntu package"
apt-get install -y curl
echo"Rerun a container after exiting"
sudo docker container start -ai ubuntu


#Alpine Linux is a Linux distribution based on musl and BusyBox, designed for security, simplicity, and resource efficiency.
echo "Create Alpine image"
sudo docker pull alpine
sudo docker image ls
echo "Bash is not present in alpine image. We use sh instead"
sudo docker container run -it alpine bash   
echo "Using sh"
sudo docker container run -it alpine sh 
echo "Type exit to stop"