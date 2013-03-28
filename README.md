configurations
==============

This repository contains generic configurations for frameworks. 
I have started with CDH4 for pseudo-distributed mode, which can take up to few days of tries and errors.

CDH4 instructions:
- Follow https://ccp.cloudera.com/display/CDH4DOC/CDH4+Installation#CDH4Installation-Step3%3AInstallCDH4withYARN
- Follow https://ccp.cloudera.com/display/CDH4DOC/ZooKeeper+Installation#ZooKeeperInstallation-InstallingtheZooKeeperBasePackage
- Follow https://ccp.cloudera.com/display/CDH4DOC/HBase+Installation#HBaseInstallation-ConfiguringHBaseinPseudodistributedMode
- Update /etc/environment accordingly to the environment file from this repo
- Update /etc/hosts and comment-out line with 127.0.1.1
