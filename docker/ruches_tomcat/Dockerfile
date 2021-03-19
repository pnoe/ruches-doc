FROM tomcat:9.0.44-jdk15-openjdk-buster
# spring ne fonctionne pas avec tomcat 10
ARG MAVEN_VERSION=3.6.3
ARG USER_HOME_DIR="/root"
ARG SHA=c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

RUN set -eux; \
  if [ ! -d $CATALINA_HOME/webapps/ROOT ]; then \
    mkdir -p /usr/share/maven /usr/share/maven/ref; \
    curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz; \
    echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c -; \
    tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1; \
    rm -f /tmp/apache-maven.tar.gz; \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn; \
    git clone https://gitlab.com/ruches/ruches.git; \
    cd ruches; \
    mvn clean package -DskipTests; \
    rm -rf $CATALINA_HOME/webapps/*; \
    mkdir $CATALINA_HOME/webapps/ROOT; \
    cd $CATALINA_HOME/webapps/ROOT; \
    jar -xvf $CATALINA_HOME/ruches/target/ruches.war.original; \
    rm -rf $CATALINA_HOME/ruches $MAVEN_CONFIG; \
    echo "spring.datasource.jndi-name=false\n \
      spring.datasource.url=jdbc:postgresql://postgres:5432/ruches\n \
      spring.datasource.username=postgres\n \
      spring.datasource.password=postgres" >> $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/application.properties; \
  fi
