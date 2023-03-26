FROM ubuntu:22.04
RUN apt-get -y update && apt-get -y install apache2
RUN mkdir -p /opt/apache2/www.test.com /opt/apache2/logs
COPY ./apache2.conf /etc/apache2/
COPY ./apache.conf /etc/apache2/sites-available/
RUN a2ensite apache && a2dissite 000-default.conf
CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80
