FROM tomcat:9.0.65-jdk17
# jdk : voir version dans pom.xml
# tomcat : spring 2.6 ne fonctionne pas avec Tomcat 10
ARG MAVEN_VERSION=3.8.6
ARG USER_HOME_DIR="/root"
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

RUN set -eux; \
  if [ ! -d $CATALINA_HOME/webapps/ROOT ]; then \
    mkdir -p /usr/share/maven /usr/share/maven/ref; \
    curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz; \
    tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1; \
    rm -f /tmp/apache-maven.tar.gz; \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn; \
    apt-get update; \
    apt-get install -y --no-install-recommends git; \
    git clone https://gitlab.com/ruches/ruches.git; \
    cd ruches; \
    mvn clean package -DskipTests; \
    rm -rf $CATALINA_HOME/webapps/*; \
    mkdir $CATALINA_HOME/webapps/ROOT; \
    cd $CATALINA_HOME/webapps/ROOT; \
    jar -xvf $CATALINA_HOME/ruches/target/ruches.war.original; \
    rm -rf $CATALINA_HOME/ruches $MAVEN_CONFIG; \
    echo "\n \
      spring.datasource.url=jdbc:postgresql://postgres:5432/ruches\n \
      spring.datasource.username=postgres\n \
      spring.datasource.password=postgres" >> $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/application.properties; \
  fi