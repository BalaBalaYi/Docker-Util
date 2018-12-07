# 注意事项  
1. 经测试，k8s v1.11 5.7.19兼容性最好，其它版本均需修改init容器来解决兼容性问题。

2. 使用openebs作为持久化存储，测试失败，效果同：https://github.com/helm/charts/issues/4900 ，未解决。
解释：mysql galera作为典型的cluster分布式应用，天然支持多主读写，无failover等问题，可直接通过控制集群规模达到很好的高可用性.关于具体为何无法使用openebs，探究中...
