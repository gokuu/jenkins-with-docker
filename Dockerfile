# Copied from https://github.com/getintodevops/jenkins-withdocker
FROM jenkins/jenkins:lts
MAINTAINER pedro@bbde.org
USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
  apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
  apt-get update && \
  apt-get -y install docker-ce
