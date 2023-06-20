Use docker to test "ruches".

"Ruches" program is fetch from gitlab using git in Tomcat container.
Postgresql database is populated with an apiary, a few hives, swarms and supers.

Google maps are not available, you need a key and a credit card !
OpenStreetMaps and IGN (France only) maps are availble.
OpenWeatherMap for weather info in apiaries also need a key.
See docs/install/installation.txt


- Install docker :
   -- https://docs.docker.com/get-docker/

- Run ruches
   -- Copy docker directory, cd in this directory
   -- run : docker-compose up -d
   -- In an internet browser : http://localhost:8080
         login : admin   password : admin  

- To stop docker and keep database and ruches program : docker-compose down
- To stop docker and remove all : docker-compose down --rmi all -v
- Afficher les logs de Tomcat : docker logs docker_tomcat_1

Tomcat and Maven may be out of date and not found.
In case of error, modify Dockerfile to last version of Tomcat 10 and of Maven.
Tested with Tomcat 10.1-jdk17 and Maven 3.9.2
