#!/bin/bash
sudo docker run -v /var/hstation/dfs:/dfs -v /var/hstation/workspace:/workspace -v /var/hstation/logs:/hlogs -h metis.effervens.com -i -t bohdanm/cdh_4_5 /bin/bash -l
