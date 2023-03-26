FROM centos:7
RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install nginx \
    && yum clean all
RUN mkdir -p /opt/nginx/www.test.com /opt/nginx/logs
COPY ./private.key /etc/pki/nginx/private/server.key
COPY ./certificate.crt /etc/pki/nginx/certs/server.crt
COPY ./nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
