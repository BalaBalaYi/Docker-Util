#!/bin/bash

# Please check the 'change log' on https://github.com/kubernetes/kubernetes
# Here is v1.11.5 by default:
DOWNLOAD_URL="https://dl.k8s.io/v1.11.5/kubernetes-client-linux-amd64.tar.gz"

# install kubectl
wget ${DOWNLOAD_URL} -O kubernetes-client.tar.gz
tar -xvf kubernetes-client.tar.gz
mv ./kubernetes/client/bin/kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

# Please copy your kubernetes config file into ~/.kube/config
mkdir ~/.kube/

rm -fr ./kubernetes && rm -fr kubernetes-client.tar.gz

exit 0