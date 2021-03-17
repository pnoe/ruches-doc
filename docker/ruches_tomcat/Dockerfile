FROM tomcat:9.0.44-jdk11-openjdk-buster
RUN set -eux; \
    echo "deb http://deb.debian.org/debian buster contrib" >> /etc/apt/sources.list; \ 
    apt update; \
    apt upgrade -y; \ 
    apt install -y --no-install-recommends maven; \
    rm -rf /var/lib/apt/lists/*; \
    git clone https://gitlab.com/ruches/ruches.git; \
    cd ruches; mvn clean package -DskipTests; \
    rm -rf $CATALINA_HOME/webapps/*; \
    mkdir $CATALINA_HOME/webapps/ROOT; \
    cd $CATALINA_HOME/webapps/ROOT; jar -xvf $CATALINA_HOME/ruches/target/ruches.war.original
COPY application.properties /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
