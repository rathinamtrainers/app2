# Sample Dockerfile to build an Apache Web Server container image
FROM centos
USER default
MAINTAINER Rajan &lt;rajan@rathinamtrainers.com>
EXPOSE 8080
USER root
RUN yum -y install httpd && yum clean all -y
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf 
RUN echo "Welcome to Rathinam Trainers" > /var/www/html/index.html
RUN chmod -R a+rwx /run/httpd /etc/httpd/logs
# OCP ignores uid. Image should work with any, that's why rwx above
USER 1001
# should change apache config to log to stdout
CMD /bin/bash -c 'echo Starting web server... ; /usr/sbin/httpd -DFOREGROUND || echo Apache Httpd startup failed: $?'

