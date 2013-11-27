configurations
==============

This repository contains generic configurations for frameworks. 
I have started with CDH4 for pseudo-distributed mode, which can take up to few days of tries and errors.

CDH4 instructions:
- Follow https://ccp.cloudera.com/display/CDH4DOC/CDH4+Installation#CDH4Installation-Step3%3AInstallCDH4withYARN
- Follow https://ccp.cloudera.com/display/CDH4DOC/ZooKeeper+Installation#ZooKeeperInstallation-InstallingtheZooKeeperBasePackage
- Follow https://ccp.cloudera.com/display/CDH4DOC/HBase+Installation#HBaseInstallation-ConfiguringHBaseinPseudodistributedMode
- Update /etc/environment accordingly to the environment file from this repo
- Make sure there are no trailing spaces in environment settings (for instance MY_SETTING='/my/path ')
- Update /etc/hosts and comment-out line with 127.0.1.1

Assumptions:
- Java is installed into /opt/jdk
- Box has fully-qualified domain name (something like PC-107.mydomain.com)

Setting up fully-qualified domain name
- $> sudo vim.tiny /etc/hosts
     127.0.0.1       localhost
     127.0.0.1       hstation.mylab.com hstation
- $> sudo domainname mylab.com
- $> sudo hostname hstation.mylab.com hstation
- $> sudo vim.tiny /etc/hostname
     hstation