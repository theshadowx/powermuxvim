FROM ubuntu:18.04
MAINTAINER Ali Diouri <alidiouri@gmail.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update           && \
    apt-get upgrade -y       && \
    apt-get install -y          \
            sudo                \
            git                 \
            wget                \
            vim                 \
            tmux                \
            python3-pip      && \
    apt clean
 

ENV LANG C.UTF-8  
ENV LC_ALL C.UTF-8  

RUN adduser --disabled-password --gecos "" devdocker &&\
    echo "devdocker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devdocker

USER devdocker
ENV HOME /home/devdocker
WORKDIR  /home/devdocker

ADD .vimrc     $HOME/
ADD .bashrc    $HOME/
ADD .tmux.conf $HOME/

RUN mkdir -p ~/.vim/autoload/ &&\
    wget -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\
    vim +'PlugInstall --sync' +qa

RUN pip3 install --user git+git://github.com/powerline/powerline

CMD ["tmux", "-2u"]

