FROM jupyter/datascience-notebook

USER root
RUN apt-get update &&\
		apt-get install -y mecab mecab-ipadic-utf8 swig libmecab-dev build-essential file
ARG neologd_dir=/tmp/mecab-ipadic-neologd
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git $neologd_dir &&\
		cd $neologd_dir &&\
		./bin/install-mecab-ipadic-neologd -n -y

USER $NB_USER 
RUN pip install \
		mecab-python3 \
		pandas-gbq \
		gensim

