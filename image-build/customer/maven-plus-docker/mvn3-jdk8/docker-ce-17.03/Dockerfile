FROM maven:3-jdk-8
MAINTAINER BalaBalaYi

RUN sudo apt-get update -y
RUN	sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN	sudo apt-get update -y
RUN	sudo apt-get install docker-ce=`apt-cache madison docker-ce | grep 17.03.2 | awk -F "|" '{print $2}' | sed 's/^[[:space:]]*//g'`