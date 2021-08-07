FROM tensorflow/tensorflow:latest-gpu

WORKDIR /home/joe/github/research/tf_speed_test/

RUN pip install -U pip
RUN pip install -U tensorflow
RUN pip install jupyter seaborn matplotlib

ARG user=joe
ARG group=joe
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -d /home/${user} -s /bin/sh ${user}
RUN chown -R joe /home/joe
RUN usermod -a -G sudo joe
RUN echo -e "linux\nlinux" | passwd joe

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

USER joe
ENV HOME /home/joe

