# system-wide structure
sudo -u hdfs hadoop fs -mkdir /tmp
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

sudo -u hdfs hadoop fs -mkdir /tmp/hadoop-yarn/staging
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging

sudo -u hdfs hadoop fs -mkdir /tmp/hadoop-yarn/staging/history/done_intermediate
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging/history/done_intermediate

sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging

sudo -u hdfs hadoop fs -mkdir /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn

# user-specific structure
sudo -u hdfs hadoop fs -mkdir /user/bohdan
sudo -u hdfs hadoop fs -chown bohdan /user/bohdan

sudo -u hdfs hadoop fs -mkdir /user/history
sudo -u hdfs hadoop fs -chmod -R 1777 /user/history

sudo -u hdfs hadoop fs -mkdir /user/yarn
sudo -u hdfs hadoop fs -chown yarn /user/yarn

# HBase-specific structure
sudo -u hdfs hadoop fs -mkdir /hbase
sudo -u hdfs hadoop fs -chown hbase /hbase