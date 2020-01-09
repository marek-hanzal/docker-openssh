FROM alpine

RUN \
    apk update && \
    apk add \
        dumb-init openssh

ADD rootfs/ /

RUN echo 'root:1234' | chpasswd
RUN chmod 600 -R /etc/ssh

WORKDIR /opt/app

ENTRYPOINT ["dumb-init", "--"]
CMD ["/usr/sbin/sshd", "-D"]
