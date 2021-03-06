FROM ubuntu:18.04
LABEL author="kenny" mail="zhouxiaochuan@cgyinfo.com" url="http://www.cgyinfo.com"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt
RUN mkdir /etc/rapidfs \
    && mkdir /var/lib/rapidfs \
    && mkdir /var/log/rapidfs

# set apt-get sources and install the necessary softwares
RUN apt-get update && apt-get install -y --no-install-recommends curl wget git \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/cgyinfo/rapidfs.git
WORKDIR /opt/rapidfs
RUN cp ./certs/* /etc/rapidfs/ \
    && sed -i 's/`${__dirname}/certs/server.crt`//etc/rapidfs/server.crt/g' config.js \
    && sed -i 's/`${__dirname}/certs/server.key`//etc/rapidfs/server.key/g' config.js \
    && sed -i 's/`${__dirname}/data`//var/lib/rapidfs/g' config.js \
    && sed -i 's/`${__dirname}/logs/rapidfs.log`//var/log/rapidfs/rapidfs.log/g' config.js \
    && npm install

VOLUME /etc/rapidfs
VOLUME /var/log/rapidfs
VOLUME /var/lib/rapidfs
EXPOSE 8878 8879

# entrypoint
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
