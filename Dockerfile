FROM chargetripio/chargetrip-docker-aws:latest

ENV MAVEN_VERSION 3.6.3
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-14-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

RUN apk update && apk --update upgrade

RUN apk add --update ca-certificates && rm -rf /var/cache/apk/*

RUN apk add libbz2 \
    expat \
    sparsehash \
    zlib \
    curl \
    make \
    openssh-client \
    zip \
    groff \
    less

RUN apk add openjdk14 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN cd /tmp
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN tar -zxvf ./apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN rm ./apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN mv ./apache-maven-$MAVEN_VERSION $MAVEN_HOME

RUN /usr/bin/java -version
