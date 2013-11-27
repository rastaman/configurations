# system-wide structure
sudo -u hdfs hdfs dfs -mkdir /tmp
sudo -u hdfs hdfs dfs -chmod -R 1777 /tmp

sudo -u hdfs hdfs dfs -mkdir /tmp/hadoop-yarn/staging
sudo -u hdfs hdfs dfs -chmod -R 1777 /tmp/hadoop-yarn/staging

sudo -u hdfs hdfs dfs -mkdir /tmp/hadoop-yarn/staging/history/done_intermediate
sudo -u hdfs hdfs dfs -chmod -R 1777 /tmp/hadoop-yarn/staging/history/done_intermediate

sudo -u hdfs hdfs dfs -chown -R mapred:mapred /tmp/hadoop-yarn/staging

sudo -u hdfs hdfs dfs -mkdir /var/log/hadoop-yarn
sudo -u hdfs hdfs dfs -chown yarn:mapred /var/log/hadoop-yarn

# user-specific structure
sudo -u hdfs hdfs dfs -mkdir /user/bohdan
sudo -u hdfs hdfs dfs -chown bohdan /user/bohdan

sudo -u hdfs hdfs dfs -mkdir /user/history
sudo -u hdfs hdfs dfs -chmod -R 1777 /user/history

sudo -u hdfs hdfs dfs -mkdir /user/yarn
sudo -u hdfs hdfs dfs -chown yarn /user/yarn

# HBase-specific structure
sudo -u hdfs hdfs dfs -mkdir /hbase
sudo -u hdfs hdfs dfs -chown hbase /hbase

# print created HDFS filesystem tree structure
sudo -u hdfs hdfs dfs -ls -R /
