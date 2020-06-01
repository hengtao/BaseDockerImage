## Dependency Image
FROM centos:latest
## MAINTAINER
MAINTAINER Michael && wanght@gooalgene.com
## set WORKDIR to install software&&packages
WORKDIR /root/bio_tools
## install libs&&tools
RUN yum groupinstall "Development Tools" -y && \
	yum install wget which vim gsl-devel mpfr-devel gmp-devel -y && \
	yum clean all && \
	echo "alias les='less -S'" >> ~/.bashrc && \
	echo "alias  rm='rm -f'" >> ~/.bashrc && \
	echo "alias ...='cd ../..'" >> ~/.bashrc && \
	echo "alias ....='cd ../../../'" >> ~/.bashrc && \
	echo "alias egrep='egrep --color=auto'" >> ~/.bashrc && \
	echo "alias grep='grep --color=auto'" >> ~/.bashrc && \
	echo "alias l.='ls -d .* --color=auto'" >> ~/.bashrc && \
	echo "alias ll='ls -l --color=auto'" >> ~/.bashrc && \
	echo "alias ls='ls --color=auto'" >> ~/.bashrc && \
	echo "alias l='ls -AlF'" >> ~/.bashrc && \
	source ~/.bashrc

## python3&&R
RUN conda install R=3.6.0 -y && \
	conda create --name python=2.7.18 -y && \
	conda install python=3.8.2 -y && \
	pip install Cython --timeout 300
	
## software&&packages
RUN wget https://mirrors.ustc.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
	sh Miniconda3-latest-Linux-x86_64.sh -b -p /root/bio_tools/anaconda3 && \
	echo "export PATH=/root/bio_tools/anaconda3/bin:\$PATH" >> ~/.bashrc && \
	source ~/.bashrc && \
	conda config --add channels conda-forge && \
	conda config --add channels defaults && \
	conda config --add channels r && \
	conda config --add channels bioconda && \
	conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/ && \
	conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/ && \
	conda config --set show_channel_urls yes
