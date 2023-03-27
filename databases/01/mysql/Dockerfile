FROM mysql:latest
ENV MYSQL_DATABASE=example_db
ENV MYSQL_ROOT_PASSWORD=example
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
CMD ["mysqld"]
