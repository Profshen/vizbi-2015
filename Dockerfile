#
# Docker image for VIZBI 2015 Tutorial
#
# This is a generic setup for network data analysis and visualization.
# This Distribution includes:
#  - Python
#  - IPython Notebook
#  - Standard data analysis tools
#  - NetworkX, igraph, and graph-tool
#
FROM ipython/scipyserver

MAINTAINER Keiichiro Ono <kono@ucsd.edu>

RUN mkdir /graph-tool
WORKDIR /graph-tool
ADD . /graph-tool

RUN echo "deb http://downloads.skewed.de/apt/trusty trusty universe" >>/etc/apt/sources.list
RUN echo "deb-src http://downloads.skewed.de/apt/trusty trusty universe" >>/etc/apt/sources.list
RUN apt-key add graph-tool-pub-key.txt

RUN apt-get update && \
	apt-get install -y build-essential libxml2-dev libxslt1-dev \
		python-dev libzmq3-dev libcurl4-openssl-dev python3-graph-tool

RUN pip install networkx python-igraph py2cytoscape requests bokeh

WORKDIR /notebooks