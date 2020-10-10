These Terraform scripts will create a elastic search cluster of 3 node of type m3.medium 
default username: elastic , password: change me 

To set the number of nodes on the cluster edit the value of count (which is 3 as of now ) elasticsearch-instance.tf

the created cluster as of now will be accessible by public ip-address_node:9200 , then using the credentials and password
============Enabled Feature=================

3 node cluster
capacity to inclease the nodes with count variable


============Missing features================
Securing communication between the nodes using SSL certificates 
ref: https://www.elastic.co/guide/en/elasticsearch/reference/current/configuring-tls.html

