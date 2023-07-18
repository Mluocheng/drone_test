# 定制的镜像都是基于 FROM 的镜像，这里将node:12.18.4设成基础镜像
# node后面跟的tag，可以在docker hub中（上方网址）查找项目所需的tag
FROM node:18.14.0 as build

# 指定工作目录。用 WORKDIR 指定的工作目录，会在构建镜像的每一层中都存在。
# WORKDIR 指定的工作目录，必须是提前创建好的
WORKDIR /tmp

# 复制指令，从上下文目录中复制文件或者目录到容器里指定路径。
# COPY [--chown=<user>:<group>] <源路径1>...  <目标路径>
# [--chown=<user>:<group>]：可选参数，用户改变复制到容器内文件的拥有者和属组。
# <目标路径>：容器内的指定路径，该路径不用事先建好，路径不存在的话，会自动创建。
COPY . .

# RUN：用于执行命令
# 清理npm缓存
# 以下两个RUN命令可简化为RUN npm cache verify && npm cache clean -f
RUN npm cache verify
RUN npm cache clean -f

# 安装依赖并构建
RUN npm install --registry https://registry.npm.taobao.org && npm run build

# 以nginx:1.12.2为基础镜像
# nginx后面跟的tag，可以在docker hub中（上方网址）查找项目所需的tag
FROM nginx:1.12.2

# 修改/usr/share/nginx/html里面的内容为前端需要部署的静态文件，这样前端就跑在nginx上了
WORKDIR /usr/share/nginx/html
RUN rm -f *
COPY --from=build /dist .

# 替换default.conf文件，解决单页面部署后刷新404问题
COPY --from=build /tmp/default.conf /etc/nginx/conf.d/default.conf
