FROM ubuntu:bionic

WORKDIR /root/

RUN apt-get update -y && apt-get install -y ssh rsync wget curl net-tools vim openjdk-8-jdk openjdk-8-jre

RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.8
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys2

COPY hadoop-3.1.1.tar.gz /root/
RUN tar -xzvf /root/hadoop-3.1.1.tar.gz -C /root/ && rm -f /root/hadoop-3.1.1.tar.gz

COPY prepare_hadoop.sh /root/

COPY conf /root/conf
COPY data /root/data
COPY mapreducer /root/mapreducer

RUN chmod +x /root/mapreducer/mapper.py
RUN chmod +x /root/mapreducer/reducer.py

EXPOSE 50070 8088

ENTRYPOINT [ "/root/prepare_hadoop.sh" ]