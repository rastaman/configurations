#!/bin/bash

set -x

# HBase section
sudo service hbase-regionserver stop
sudo service hbase-master stop
sudo service zookeeper-server stop

# YARN section
sudo service hadoop-mapreduce-historyserver stop
sudo service hadoop-yarn-nodemanager stop
sudo service hadoop-yarn-resourcemanager stop

# HDFS section
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x stop ; done

sudo $JAVA_HOME/bin/jps