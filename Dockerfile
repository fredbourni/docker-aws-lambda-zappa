FROM amazonlinux

ARG ZAPPA_VERSION=latest

RUN yum install -y gcc && \
    yum install -y python-setuptools && \
    yum install -y openssl && \
    yum install -y openssl-devel && \
    yum install -y python-setuptools && \
    yum install -y python27-devel && \
    curl -s https://bootstrap.pypa.io/get-pip.py | python && \
    echo "virtualenv" > requirements.txt && \
    echo "zappa" >> requirements.txt && \
    if [ "$ZAPPA_VERSION" != "latest" ]; then \
       sed -i " 2 s/.*/&==$ZAPPA_VERSION/" requirements.txt; \
    fi && \
    pip install -r requirements.txt && \
    rm requirements.txt && \
    rm -rf /root/.cache/pip && \
    yum clean all

VOLUME /data

WORKDIR /data

CMD ["zappa"]