FROM centos:7
RUN yum -y update && yum install -y epel-release && yum install -y nginx
RUN mkdir -p /opt/nginx/www.test.com /opt/nginx/logs
COPY ./nginx.conf /etc/nginx
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80