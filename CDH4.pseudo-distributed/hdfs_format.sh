# $FS_MOUNT_POINT stands for fully qualified Linux filesystem path 
# to the mount point where Hadoop folders and structures reside.
# For instance: /media/_media_1TB

FS_MOUNT_POINT=/dfs

sudo sudo mkdir --mode=777 $FS_MOUNT_POINT
sudo chown -R hdfs:hadoop $FS_MOUNT_POINT

sudo sudo mkdir --mode=777 $FS_MOUNT_POINT/hadoop_tmp
sudo chown -R hdfs:hadoop $FS_MOUNT_POINT/hadoop_tmp

sudo sudo mkdir --mode=777 $FS_MOUNT_POINT/zookeeper
sudo chown -R zookeeper:zookeeper $FS_MOUNT_POINT/zookeeper

# initializes Zookeeper
sudo service zookeeper-server init

# formats HDFS namenode
sudo -u hdfs hdfs namenode -format
