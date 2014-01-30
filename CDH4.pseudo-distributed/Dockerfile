FROM    ubuntu:precise
MAINTAINER Bohdan Mushkevych

# Patching policy file
RUN rm /usr/sbin/policy-rc.d

# Installing Oracle JDK
RUN apt-get update ;\
    apt-mark hold initscripts udev plymouth mountall ;\
    apt-get -y install python-software-properties ;\
    add-apt-repository ppa:webupd8team/java ;\
    apt-get update && apt-get -y upgrade ;\
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections ;\
    apt-get -y install oracle-java7-installer && apt-get clean ;\
    update-alternatives --display java ;\
    export JAVA_HOME=/usr/lib/jvm/java-7-oracle ;\
    ln -s /usr/lib/jvm/java-7-oracle /opt/jdk ;\
    export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec ;\
# Cloudera CDH4 APT key and DPKG repositories
RUN apt-get -y install curl ;\
    curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | apt-key add - ;\
    echo "deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib\ndeb-src http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib" > /etc/apt/sources.list.d/cloudera.list

# Removing anything extra and installing pseudo distributed YARN-powered Hadoop 
RUN apt-get remove hadoop-0.20-conf-pseudo hadoop-0.20-mapreduce-* ;\
    apt-get update ; apt-get install -y hadoop-conf-pseudo

# Installing zookeeper
RUN apt-get install zookeeper-server ;\

# Installing HBase
RUN apt-get install -y hbase ;\
    apt-get install -y hbase-master ;\
    apt-get install -y hbase-regionserver

# Installing Pig
RUN apt-get install -y pig

# Install command-line utils
RUN apt-get install ping ;\
    apt-get install -y vim.tiny

# Copy configuration files
ADD ./etc/ /etc/
ADD ./root_scripts/ /root/

# Init environment
RUN cat /root/set_env >> /etc/profile

RUN unlink /etc/hadoop/conf
ADD ./hadoop/ /etc/hadoop/conf/

RUN unlink /etc/hbase/conf
ADD ./hbase/ /etc/hbase/conf/

RUN unlink /etc/zookeeper/conf
ADD ./zookeeper/ /etc/zookeeper/conf/

# Replace placeholders with the actual settings
RUN sed -i 's/$HOST_ADDRESS/your.host.name/g' /etc/hadoop/conf/*
RUN sed -i 's/$HOST_ADDRESS/your.host.name/g' /etc/hbase/conf/*
RUN sed -i 's/$HOST_ADDRESS/your.host.name/g' /etc/zookeeper/conf/*

RUN sed -i 's/$FS_MOUNT_POINT/\/dfs/g' /etc/hadoop/conf/*
RUN sed -i 's/$FS_MOUNT_POINT/\/dfs/g' /etc/hbase/conf/*
RUN sed -i 's/$FS_MOUNT_POINT/\/dfs/g' /etc/zookeeper/conf/*

# make scripts runnable
RUN chmod +x /root/*.sh

# add user <zookeeper> to group <hadoop>
RUN usermod -a -G hadoop zookeeper

# Expose Hadoop+Eco ports
# HDFS
EXPOSE 8020 50070 50075 50090

# HBase
EXPOSE 60000 60010 60020 60030 8080

# Yarn
EXPOSE 8030 8031 8032 8033 8040 8041 8042 8088 10020 19888

CMD ["/usr/local/bin/circusd", "/etc/circusd.ini"]
