# 注意事项  
1. 首次部署可以不指定 rootUser.password 和 replication.password 参数（会自动生成）。但是在执行更新时（helm update），务必指定上述参数，否则会遇到权限错误。  

2. 因为是statefuelset类型应用，因此更新有限制，例如针对pv等的更新均不允许，具体可参见[源码](https://github.com/kubernetes/kubernetes/blob/master/pkg/apis/apps/validation/validation.go#L101-L123)。

3. secret信息获取方式如下，例 rootUser.password:  
```
kubectl get secret --namespace mariadb-crltz mariadb-crltz-mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode
(mariadb-crltz 为 namespace名称，请自行替换)
```