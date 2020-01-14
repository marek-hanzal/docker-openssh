FROM alpine

RUN \
    apk update && \
    apk add \
        dumb-init openssh

ADD rootfs/ /

RUN echo 'root:1234' | chpasswd
RUN chmod 600 -R /etc/ssh
RUN chmod 600 -R /root/.ssh

WORKDIR /var/www

ENTRYPOINT ["dumb-init", "--"]
CMD ["/usr/sbin/sshd", "-D"]
