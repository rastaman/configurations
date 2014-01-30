#!/bin/bash

# $FS_MOUNT_POINT stands for fully qualified Linux filesystem path 
# to the mount point where Hadoop folders and structures reside.
# For instance: /media/_media_1TB

FS_MOUNT_POINT=/dfs

sudo mkdir --mode=777 $FS_MOUNT_POINT
sudo chown -R hdfs:hadoop $FS_MOUNT_POINT

sudo mkdir --mode=777 $FS_MOUNT_POINT/hadoop_tmp
sudo chown -R hdfs:hadoop $FS_MOUNT_POINT/hadoop_tmp

sudo mkdir $FS_MOUNT_POINT/hadoop_tmp/yarn
sudo chown yarn:yarn -R $FS_MOUNT_POINT/hadoop_tmp/yarn
sudo chmod 766 -R $FS_MOUNT_POINT/hadoop_tmp/yarn

sudo mkdir --mode=777 $FS_MOUNT_POINT/zookeeper
sudo chown -R zookeeper:zookeeper $FS_MOUNT_POINT/zookeeper

# initializes Zookeeper
sudo service zookeeper-server init

# formats HDFS namenode
sudo -u hdfs hdfs namenode -format
