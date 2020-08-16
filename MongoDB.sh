#MONGODB in docker
echo "Create a MONDODB image"
sudo docker run --name mongo -d mongo
sudo docker top mongo
#give list of processes running in the system
ps aux | grep "mongo"  

