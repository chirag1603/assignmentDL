#!/bin/bash

# Script used to set up a new node inside an Elasticsearch cluster in AWS

sudo yum update

# Java 8 Installation
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
yum localinstall -y jdk-8u131-linux-x64.rpm

# Elasticsearch 5.6.3 Installation
rpm -i https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.3.rpm

echo ES_JAVA_OPTS="\"-Xms1g -Xmx1g\"" >> /etc/sysconfig/elasticsearch
echo MAX_LOCKED_MEMORY=unlimited >> /etc/sysconfig/elasticsearch

# Discovery EC2 plugin is used for the nodes to create the cluster in AWS
echo -e "yes\n" | /usr/share/elasticsearch/bin/elasticsearch-plugin install discovery-ec2

# Shortest configuration for Elasticsearch nodes to find each other
echo "discovery.zen.hosts_provider: ec2" >> /etc/elasticsearch/elasticsearch.yml
echo "cloud.aws.region: us-east-1" >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: _ec2_" >> /etc/elasticsearch/elasticsearch.yml
sudo chkconfig --add elasticsearch
sudo service elasticsearch start

# Enabling username and password based authentication with x-pack
sudo /usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack
sleep 10
sudo service elasticsearch restart
sleep 30
echo "Node setup finished!" > ~/terraform.txt