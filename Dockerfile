FROM ubuntu:20.04

ENV MAVEN_VERSION 3.6.3
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/openjdk-14-jdk
ENV PATH=$PATH:$JAVA_HOME/bin

RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

RUN apt-get update
RUN apt-get -y install \
    openjdk-14-jdk \
    libboost-all-dev \
    libbz2-dev \
    expat \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libsparsehash-dev \
    zlib1g-dev \
    curl \
    make \
    openssh-client \
    zip \
    unzip \
    bash \
    wget

RUN cd /tmp
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN tar -zxvf ./apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN rm ./apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN mv ./apache-maven-$MAVEN_VERSION $MAVEN_HOME

# Install aws-cli
RUN apt-get install -y groff less python python3-pip
RUN pip3 install awscli
