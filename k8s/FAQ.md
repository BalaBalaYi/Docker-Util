### 1. Namespace deletion stuck on 'terminating':
issue:https://github.com/kubernetes/kubernetes/issues/60807

#####  workaround:
1. Write namespace(which u want to delete) resource into json:
```
kubectl get namespace annoying-namespace-to-delete -o json > tmp.json  
```
2. Edit tmp.json and delete "kubernetes" in finalizers.
3. Using kubectl proxy (default port: 8001):
```
nohup kubectl proxy & 
```
4. Api request:
1) for rancher:
```
curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json http://127.0.0.1:8001/k8s/clusters/xxxxxx/api/v1/namespaces/annoying-namespace-to-delete/finalize
```

2) for native:
```
curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json https://127.0.0.1:8001/api/v1/namespaces/annoying-namespace-to-delete/finalize
```

5. Close kubectl proxy:
```
kill -9 pid 
(Get pid by 'ps au|grep proxy')
```

<br/>

### 2. How to access the rancher etcd:

1. Install etcdctl on host (mount to the rancher-server container) or in container.

2. Using control api: 
```
ETCDCTL_API=3 etcdctl --write-out=table --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/ssl/kube-ca.pem --cert=/etc/kubernetes/ssl/kube-etcd-127-0-0-1.pem --key=/etc/kubernetes/ssl/kube-etcd-127-0-0-1-key.pem
```


### 3. How to access the k8s etcd:

First you need to login the etcd container using docker exec or docker-enter.

#### For no tls
```
ETCDCTL_API=3 etcdctl --write-out=table endpoint status
```

#### For tls
##### Rancher
Get params using:  
```
ps aux | grep etcd
```

The output is (example):
```
/usr/local/bin/etcd --peer-client-cert-auth --client-cert-auth --election-timeout=5000 --peer-cert-file=/etc/kubernetes/ssl/kube-etcd-192-168-111-127.pem --peer-key-file=/etc/kubernetes/ssl/kube-etcd-192-168-111-127-key.pem --trusted-ca-file=/etc/kubernetes/ssl/kube-ca.pem --key-file=/etc/kubernetes/ssl/kube-etcd-192-168-111-127-key.pem --heartbeat-interval=500 --data-dir=/var/lib/rancher/etcd/ --advertise-client-urls=https://192.168.111.127:2379,https://192.168.111.127:4001 --listen-client-urls=https://0.0.0.0:2379 --initial-advertise-peer-urls=https://192.168.111.127:2380 --listen-peer-urls=https://0.0.0.0:2380 --initial-cluster=etcd-rancher-infra=https://192.168.111.127:2380 --initial-cluster-state=new --peer-trusted-ca-file=/etc/kubernetes/ssl/kube-ca.pem --initial-cluster-token=etcd-cluster-1 --name=etcd-rancher-infra --cert-file=/etc/kubernetes/ssl/kube-etcd-192-168-111-127.pem
```

Use '--advertise-client-urls' as '--endpoints', '--trusted-ca-file' as '--cacert', '--peer-cert-file' as '--cert', '--peer-key-file' as '--key' (example):  
```
ETCDCTL_API=3 etcdctl --write-out=table --endpoints=https://192.168.111.127:2379 --cacert=/etc/kubernetes/ssl/kube-ca.pem --cert=/etc/kubernetes/ssl/kube-etcd-192-168-111-127.pem --key=/etc/kubernetes/ssl/kube-etcd-192-168-111-127-key.pem endpoint status
```

##### Native
Found cacert, cert and key files (example):
```
ETCDCTL_API=3 etcdctl --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/peer.crt --key=/etc/kubernetes/pki/etcd/peer.key endpoint status
```


### 4. Let configmap pretty display:
Referenced issue: ``` https://github.com/kubernetes/kubernetes/issues/36222```
#####  workaround:
1. Using space instead of tab;
2. Don't leave space at then end of the line;
3. When using text tools like ```notepad++``` and ```ultraedit``` on windows need to pay attention on the copy-paste operations.

