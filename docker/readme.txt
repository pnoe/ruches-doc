Use docker to test "ruches".

"Ruches" program is fetch from gitlab using git in Tomcat container.
Postgresql database is populated with an apiary, a few hives, swarms and supers.

Only OpenStreetMap maps are visible. Google maps and IGN maps need a key.
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