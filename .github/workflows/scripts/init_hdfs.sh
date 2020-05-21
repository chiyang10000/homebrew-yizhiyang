#!/bin/bash
set -e



# Install
brew install hadoop

# Configure
export HADOOP_HOME=/usr/local/opt/hadoop/libexec
tee $HADOOP_HOME/etc/hadoop/core-site.xml << EOF
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:8020</value>
    </property>
    <property>
         <name>hadoop.proxyuser.admin.hosts</name>
         <value>*</value>
    </property>
    <property>
        <name>hadoop.proxyuser.admin.groups</name>
        <value>*</value>
    </property>
</configuration>
EOF
tee $HADOOP_HOME/etc/hadoop/hdfs-site.xml << EOF
<configuration>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>file:///tmp/db_data/hdfs/name</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>file:///tmp/db_data/hdfs/data</value>
    </property>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
EOF

# Initialize
install -d /tmp/db_data/hdfs/name
install -d /tmp/db_data/hdfs/data
hdfs namenode -format

# Start
/usr/local/opt/hadoop/sbin/start-dfs.sh

# Connect
hdfs dfsadmin -report
hdfs dfs -ls /
