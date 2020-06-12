#!/bin/bash

sudo yum update -y
sudo yum update -y
sudo yum install python2 -y
sudo yum install curl git zip -y
sudo touch /home/ec2-user/terraform-testfile.txt
sudo echo "welcome to EC2 machine from terraform scripts.." > /home/ec2-user/terraform-testfile.txt
sudo yum install docker -y
sudo service docker start
sudo chkconfig docker on
sudo docker pull nginx:latest
sudo git clone https://ronaldnnr:admin%231320@gitlab.com/ronaldnnr/globo.git
sudo docker login registry.gitlab.com -u ronaldnnr -p FSzmhdbxkLreXwBEnyBa
sudo docker build -t registry.gitlab.com/ronaldnnr/globo/flask-app globo/.
sudo docker push registry.gitlab.com/ronaldnnr/globo/flask-app:latest
sudo docker run -it -d -p 5000:5000 registry.gitlab.com/ronaldnnr/globo/flask-app:latest
sudo bash <(curl -Ss https://my-netdata.io/kickstart.sh)
                                
