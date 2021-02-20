FROM amazon/aws-sam-cli-build-image-ruby2.5

WORKDIR /build

ARG MYSQL_VERSION

ENV PATH=/opt/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/lib:/opt/lib64:$LD_LIBRARY_PATH
ENV MYSQL_VERSION=$MYSQL_VERSION

RUN echo '== patchelf =='
RUN git clone https://github.com/NixOS/patchelf.git && \
    cd ./patchelf && \
    git checkout 0.11 && \
    ./bootstrap.sh && \
    ./configure --prefix=/opt && \
    make && \
    make install

RUN echo '== MySQL Connector =='
RUN yum install -y cmake
RUN curl -L https://downloads.mysql.com/archives/get/p/19/file/mysql-connector-c-6.1.11-src.tar.gz > mysql-connector-c-6.1.11-src.tar.gz && \
    tar -xf mysql-connector-c-6.1.11-src.tar.gz && \
    cd mysql-connector-c-6.1.11-src && \
    cmake . -DCMAKE_BUILD_TYPE=Release && \
    make && \
    make install

RUN echo '== Install Mysql2 Gem =='
RUN rm -rf /usr/local/mysql/lib/libmysqlclient.so* && \
    gem install mysql2 \
      -v $MYSQL_VERSION \
      -- --with-mysql-dir=/usr/local/mysql

RUN echo '== Patch MySQL2 Gem =='
RUN patchelf --add-needed librt.so.1 \
      "/var/lang/lib/ruby/gems/2.5.0/gems/mysql2-${MYSQL_VERSION}/lib/mysql2/mysql2.so" && \
    patchelf --add-needed libstdc++.so.6 \
      "/var/lang/lib/ruby/gems/2.5.0/gems/mysql2-${MYSQL_VERSION}/lib/mysql2/mysql2.so"

RUN echo '== Share Files =='
RUN mkdir -p /build/share && \
    cp -r "/var/lang/lib/ruby/gems/2.5.0/gems/mysql2-${MYSQL_VERSION}"/* /build/share && \
    rm -rf /build/share/ext \
           /build/share/README.md \
           /build/share/support
