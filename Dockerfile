FROM lambci/lambda:build-ruby2.5

WORKDIR /build

ARG MYSQL_VERSION

ENV PATH=/opt/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/lib:/opt/lib64:$LD_LIBRARY_PATH
ENV MYSQL_VERSION=$MYSQL_VERSION

RUN echo '== MariaDB =='
RUN git clone https://github.com/MariaDB/server.git && \
    cd ./server && \
    git checkout 10.3 && \
    cmake . \
      -DCMAKE_INSTALL_PREFIX=/opt \
      -DWITHOUT_TOKUDB=1 && \
    make && \
    make install

RUN echo '== Install MySQL2 =='
RUN rm -rf /opt/lib/libmariadb.so* && \
    gem install mysql2 \
    -v $MYSQL_VERSION \
    -- --with-mysql-dir=/opt

RUN echo '== Share Files =='
RUN mkdir -p /build/share && \
    cp -r /var/runtime/gems/mysql2-$MYSQL_VERSION/* /build/share && \
    rm -rf /build/share/ext \
           /build/share/README.md \
           /build/share/support
