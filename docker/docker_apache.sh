#running apache in container / mounting custom html-page
docker run -dit --name docker_apache -p 8082:80 -v /home/ubuntu/docker/:/usr/local/apache2/htdocs/ httpd:2.4
