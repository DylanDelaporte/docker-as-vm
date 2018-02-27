FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo root:password | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ADD docker-entrypoint.sh /usr/local/bin
#RUN chmod +x docker-entrypoint.sh
#RUN ./docker-entrypoint.sh

EXPOSE 22 80

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]

