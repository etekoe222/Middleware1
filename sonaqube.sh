# !/bin/bash

# Author: Edem Tekoe 
# Date: 02/19/2023
#Description: Script to install SonaQube

echo "Sonarqube doesnt work when you start it as root user"

su - vagrant

echo  "Java 11 installation"

sudo yum update -y
sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y

sleep 1

echo "Download SonarQube latest versions on your server"

cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo rpm -q unzip
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip

sleep 2

echo "Change ownership to the user and Switch to Linux binaries directory to start service"

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64 
 ./sonar.sh start
 ./sonar.sh status

 echo 'Script installed successfully'
fi

 sleep 3
 #Connect to the SonarQube server through the browser. It uses port 9000.

# http://<your-ip-address>:9000


