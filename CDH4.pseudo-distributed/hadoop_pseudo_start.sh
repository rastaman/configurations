#!/bin/bash

set -x

# HDFS section
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done

# YARN section
sudo service hadoop-yarn-resourcemanager start
sudo service hadoop-yarn-nodemanager start
sudo service hadoop-mapreduce-historyserver start

# HBase section
sudo service zookeeper-server start
sudo service hbase-master start
sudo service hbase-regionserver start

sudo $JAVA_HOME/bin/jps
