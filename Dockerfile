# DOCKER-VERSION 0.7.6
# VERSION 0.0.1

FROM centos:6.4
MAINTAINER Takumi Endo tq-jappy

# repos
RUN rpm --import http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/RPM-GPG-KEY-EPEL-6
RUN rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm

# package
RUN yum -y update
RUN yum -y install svn git vim wget unzip
RUN yum -y install passwd openssh openssh-server openssh-clients sudo
RUN yum -y install gcc gcc-c++ make zlib zlib-devel readline readline-devel openssl openssl-devel curl curl-devel

# create user
RUN useradd docker
RUN passwd -f -u docker
RUN mkdir -p /home/docker/.ssh; chmod 700 /home/docker/.ssh
ADD ./authorized_keys /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys
RUN chown -R docker:docker /home/docker/.ssh

# setup sudoers
RUN echo "docker ALL=(ALL) ALL" >> /etc/sudoers.d/docker

RUN echo "sshd:all" >> /etc/hosts.allow

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

# Install Ruby
ADD ./install-ruby.sh /root/install-ruby.sh
RUN /root/install-ruby.sh

#######################################   Ruby and Node Runtime  ########################################
# Installing Rails Runtime, Ruby and Node.js
# RUN yum -y install gcc make zlib zlib-devel readline readline-devel openssl openssl-devel curl curl-devel
# ADD install.sh install.sh
# RUN chmod +x install.sh; ./install.sh;

## NODE
#RUN yum install -y nodejs

## APACHE - already in centos
#RUN yum install -y apache2 libapache2-mod-php5

## CLEAN UP
# yum install yum-utils
# package-cleanup --dupes
# package-cleanup --cleandupes
# yum clean all

## APP
# RUN rm -rf /var/www/*
# ADD ../../vagrant/src /var/www

# RESTART
# service httpd restart

# RESET

#ENV DEBIAN_FRONTEND dialog

## CONFIG
# ENV RUNNABLE_USER_DIR /var/www
# memcached -d -u www-data;
# ENV RUNNABLE_SERVICE_CMDS /etc/init.d/apache2 restart; mysqld

EXPOSE 22

# ENTRYPOINT ["/bin/bash"]

CMD ["/usr/sbin/sshd", "-D"]
