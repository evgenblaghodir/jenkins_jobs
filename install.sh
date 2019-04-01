#!/bin/bash

javavers=`java -version`
antvers=`ant -version`

echo $javavers
echo $antvers
if [ -z "$javavers"]; then
         echo "JAVA NOT INSTALLED"
         echo "Installing...."
		 cd /opt
		 wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
         tar -xvf jdk-8u201-linux-x64.tar.gz
         cd jdk1.8.0_201/
         alternatives --install /usr/bin/java java /opt/jdk1.8.0_201/bin/java 2
         alternatives --config java
         alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_201/bin/jar 2
         alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_201/bin/javac 2
         alternatives --set jar /opt/jdk1.8.0_201/bin/jar
         alternatives --set javac /opt/jdk1.8.0_201/bin/javac
         export JAVA_HOME=/opt/jdk1.8.0_201
         export JRE_HOME=/opt/jdk1.8.0_201/jre
         export PATH=$PATH:/opt/jdk1.8.0_201/bin:/opt/jdk1.8.0_201/jre/bin
         if [ -z "$antvers" ]; then
            echo "ANT not insatalled"
			cd /usr/local
            wget http://apache.volia.net//ant/binaries/apache-ant-1.9.14-bin.tar.bz2
            tar -xvf apache-ant-1.9.14-bin.tar.bz2
            echo export ANT_OPTS="-Xmx256M" >> /root/.bashrc
            echo export ANT_HOME=/usr/local/apache-ant-1.9.14-bin >> /root/.bashrc
            echo export PATH=$PATH:${ANT_HOME}/bin >> /root/.bashrc
            source ~/.bashrc
            cd /usr/local
            wget http://apache.cp.if.ua/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz
            tar -xvf apache-tomcat-8.5.39.tar.gz
			export CATALINA_HOME=/usr/local/apache-tomcat-8.5.39
            echo  $CATALINA_HOME/bin/startup.sh >> ~/.bashrc
            echo export PATH=$PATH:$CATALINA_HOME >> ~/.bashrc
            source ~/.bashrc
         else
            echo "ANT installed"
            echo $antvers
         fi
else
     echo "JAVA INSTALLED"
	 if [ -z "$antvers" ]; then
            echo "ANT not insatalled"
			cd /usr/local
            wget http://apache.volia.net//ant/binaries/apache-ant-1.9.14-bin.tar.bz2
            tar -xvf apache-ant-1.9.14-bin.tar.bz2
            echo export ANT_OPTS="-Xmx256M" >> /root/.bashrc
            echo export ANT_HOME=/usr/local/apache-ant-1.9.14-bin >> /root/.bashrc
            echo export PATH=$PATH:${ANT_HOME}/bin >> /root/.bashrc
            source ~/.bashrc
            cd /usr/local
            wget http://apache.cp.if.ua/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz
            tar -xvf apache-tomcat-8.5.39.tar.gz
			export CATALINA_HOME=/usr/local/apache-tomcat-8.5.39
            echo  $CATALINA_HOME/bin/startup.sh >> ~/.bashrc
            echo export PATH=$PATH:$CATALINA_HOME >> ~/.bashrc
            source ~/.bashrc
         else
            echo "ANT installed"
            echo $antvers
         fi
fi
