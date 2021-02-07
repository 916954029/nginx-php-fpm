## 概览

基于镜像 [richarvey/nginx-php-fpm:1.10.3](https://hub.docker.com/layers/richarvey/nginx-php-fpm/1.10.3/images/sha256-7208dee287a4dc964538d04f3763bb6588b6c5832eba0dec74ed0768cd6b85e0?context=explore) 编写的 docker-compose 化开发环境

**镜像介绍**

- **os**: Alpine Linux v3.12
- **nginx**: 1.18.0
- **php**: 7.4.9

**docker版本要求**

1.13.0+

## 目录说明

- `./src`： 项目存放路径
- `./src/scripts`： 存放自定义脚本，在 php-fpm 和 nginx 进程启动之前会被执行
- `./conf/nginx/sites-enabled`： 存放 nginx 虚拟主机配置
- `./conf/nginx/cert`： 存放 ssl 证书和私钥文件

## 自定义环境变量

执行 `cp .env.example .env` 命令创建环境变量自定义文件，根据需求修改。

## 关于开启 xdebug （phpstorm 可使用）

打开根目录下 `.env` 配置文件中的以下环境变量

- `RUN_SCRIPTS=1`
- `ENABLE_XDEBUG=1`
- `XDEBUG_CONFIG=remote_host=172.20.152.78`，把 `172.20.152.78` 修改为你的宿主机 ip
- `XDEBUG_ROMETE_PORT=9003`
- `PHP_IDE_CONFIG=serverName=local.thinkcmf.com`，把 `local.thinkcmf.com` 修改为你的域名

**注意**： 开启 xdebug 扩展时需等待其安装完成才可访问网站。

## 命令参考

- `sudo docker-compose up -d` 创建并启动环境
- `sudo docker-compose down` 关闭环境并删除容器、网络、镜像和卷
- `sudo docker-compose ps` 运行中的容器列表
- `sudo docker-compose top` 容器内的运行进程
- `sudo docker-compose cp local-alnp:/path/in/container /path/in/host` 从容器内向宿主机拷贝文件
- `sudo docker-compose exec -it local-alnp /bin/bash` 登录容器
- `sudo docker-compose logs` 打印容器输出的日志
