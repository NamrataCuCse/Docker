#Docker Create 
echo "Docker Create nginx"
sudo docker create --name nginx_base -p 80:80 nginx:alpine
sudo docker start nginx_base

#Inspect Images
echo "Inspect Docker image"
sudo docker images

#Inspect Containers

echo "container is not running"
sudo docker ps -a
echo "container is running"
sudo docker ps

#Docker start and stop 
echo "Start the Container"
sudo docker start nginx_base

echo "Stop the Container"
sudo docker stop nginx_base

#Modify the Running Container
#create a new index.html file  
echo "Enter path to index.html"
read idxpath
echo "Copy index.html onto the running container"
sudo docker cp $idxpath nginx_base:/usr/share/nginx/html/index.html
echo "Create an Image From a Container"
sudo docker commit nginx_base

#Tag the Image
echo "Enter container-id"
read conid
sudo docker tag $conid mom
echo "Create Images With Tags"
sudo docker commit nginx_base mom

#Delete the Original Container
echo "Delete container"
sudo docker ps
sudo docker container stop $conid