# 注意事项  
### 1. k8s 下 stolonctl 使用样例：
##### 查询集群状态（默认配置，使用kubernetes configmap存储集群数据）
```
stolonctl --cluster-name stolon --store-backend kubernetes --kube-resource-kind configmap status
```

##### 更新资源，例如更新hba信息
```
stolonctl --cluster-name stolon --store-backend kubernetes --kube-resource-kind configmap update --patch '{ "pgHBA" : ["host all root 0.0.0.0/0 md5"] }'
```

