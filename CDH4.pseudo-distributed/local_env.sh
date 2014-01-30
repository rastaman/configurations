#!/bin/bash
sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker

sudo mkdir -p --mode=777 /var/hstation/dfs
sudo mkdir -p --mode=777 /var/hstation/workspace
sudo mkdir -p --mode=777 /var/hstation/logs