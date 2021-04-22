FROM devopsedu/webapp
MAINTAINER Gaurav_tyagi@gmail.com
RUN rm -rf /var/www/html/
RUN apt-get update -y
RUN apt-get install -y git
RUN mkdir /root/.ssh/ /var/www/html/
ADD .ssh/id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
WORKDIR /tmp
RUN git clone https://github.com/edureka-devops/projCert.git
RUN cp -arv /tmp/projCert/website/* /var/www/html/
RUN /bin/bash  /etc/apache2/envvars
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
