FROM amazonlinux

RUN yum install -y gcc && \
    yum install -y python-setuptools && \
    yum install -y openssl && \
    yum install -y openssl-devel && \
    yum install -y python-setuptools && \
    yum install -y python27-devel && \
    curl -s https://bootstrap.pypa.io/get-pip.py | python && \
    pip install virtualenv zappa 

VOLUME /data

WORKDIR /data

EXPOSE 5000

CMD ["zappa"]