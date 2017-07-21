# License MIT
# 
# Copyright (c) 2017 Stephen Hamilton
# 
# WebCenter Sites Dockerfile
# -----------------------------------------------------------------------------
# This is the dockerfile for Oracle WebCenter Sites 12c (12.2.1.2)
# 
# Required Files
# -----------------------------------------------------------------------------
# 1)
# 2)
# 3)
# 
# Usage
# -----------------------------------------------------------------------------
# With all files in the same directory as this dockerfile, run the following 
# command:
#
#	> docker build -f Dockerfile -t sshamilt/webcenter-sites-12.2.1.2 .
#
# Notes
# -----------------------------------------------------------------------------
# Starting with the Oracle Docker Container of
# 		oraclelinux:latest
# 
# Install MySQL and initialize it using volume "/var/lib/sysql"
# 
# Install JDK8
# 
# This results in a domain with the following:
#		NodeManager
#		AdminServer
#		WCS_server1
# 
# The users and passwords are set as
#		Linux Users
#			root/welcome1
#			oracle/welcome1
#		MySQL users
#			root/welcome1
#		WebLogic Users
#			weblogic/welcome1
#			
#
# -----------------------------------------------------------------------------
# start from the latest oracle linux
#
FROM oraclelinux:latest

# -----------------------------------------------------------------------------
# start from the latest oracle linux
#
RUN echo 'Installing MySQL'

ENV PACKAGE_URL=https://repo.mysql.com/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.10-1.el7.x86_64.rpm MYSQL_ROOT_PASSWORD=welcome1

# Install server
RUN rpmkeys --import http://repo.mysql.com/RPM-GPG-KEY-mysql \
  && yum install -y $PACKAGE_URL \
  && yum install -y libpwquality \
  && rm -rf /var/cache/yum/*
  
# create a directory for the database initialization script and copy it in
RUN mkdir /docker-entrypoint-initdb.d
COPY docker-entrypoint.sh /entrypoint.sh

#set up for the MySQL data volume
VOLUME /u01/data/mysql

ENTRYPOINT ["/entrypoint.sh"]

# export the port to use for MySQL
EXPOSE 3306

# start the MySQL deamon
#CMD ["mysqld"]

