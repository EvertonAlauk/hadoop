#!/bin/sh

/etc/init.d/ssh start

mkdir /usr/java
ln -s /usr/lib/jvm/java-1.8.0-openjdk-amd64 /usr/java/latest

ln -s /root/hadoop-3.1.1 /root/hadoop

echo 'export JAVA_HOME="/usr/java/latest"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_NAMENODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_NAMENODE_GROUP="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_DATANODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_SECONDARYNAMENODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export YARN_NODEMANAGER_USER="root"' >> /root/hadoop/etc/hadoop/yarn-env.sh
echo 'export YARN_RESOURCEMANAGER_USER="root"' >> /root/hadoop/etc/hadoop/yarn-env.sh

cp /root/conf/core-site.xml /root/hadoop/etc/hadoop/
cp /root/conf/hdfs-site.xml /root/hadoop/etc/hadoop/
cp /root/conf/mapred-site.xml /root/hadoop/etc/hadoop/
cp /root/conf/yarn-site.xml /root/hadoop/etc/hadoop/

/root/hadoop/bin/hdfs namenode -format
/root/hadoop/sbin/start-dfs.sh
/root/hadoop/sbin/start-yarn.sh

/bin/bash