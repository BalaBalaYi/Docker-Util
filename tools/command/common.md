| 命令 | 描述 |
|:-------:|:-------:|
| sudo systemctl start docker | 启动 docker 服务 |
| sudo systemctl enable docker | 停止 docker 服务 |
| sudo docker pull | 从 docker 仓库下载一个镜像 |
| sudo docker build | 构建一个镜像 |
| sudo docker run | 运行一个容器 |
| sudo docker stop | 停止一个容器 |
| sudo docker start | 运行一个已经停止的容易 |
| sudo docker ps -a | 显示所有的容器，包括未运行的 |
| sudo docker ps -l | 显示最近创建的容器 |
| sudo docker ps -s | 显示容器总的文件大小 |
| sudo docker images | 显示所有的镜像 |
| sudo docker rmi | 删除一个镜像 |
| sudo docker images -q | 删除所有镜像 |
| sudo docker rm | 删除一个容器 |
| docker rm $(docker ps -a -q) | 删除所有容器 |
| sudo docker logs | 查看日志 |
| sudo docker exec -it gitlab bash | 进入 gitlab 容器，并执行 bash 命令（Ctrl + D 退出） |