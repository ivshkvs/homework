FROM ubuntu:22.04
RUN apt-get update \
    && apt-get install -y apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/apache2/www.test.com /opt/apache2/logs
COPY ./apache2.conf /etc/apache2/
COPY ./apache.conf /etc/apache2/sites-available/
COPY ./private.key /etc/ssl/private/server.key
COPY ./certificate.crt /etc/ssl/certs/server.crt
RUN a2ensite apache && a2dissite 000-default.conf
CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80
