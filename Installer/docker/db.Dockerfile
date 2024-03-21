FROM mysql
WORKDIR /docker-entrypoint-initdb.d/
COPY ./noderatio.sql script.sql
CMD mysql -u root -p Vkm#1234 < script.sql
