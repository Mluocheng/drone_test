# drone_test

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```



--volume=/var/lib/drone:/data \
  --env=DRONE_GITEE_CLIENT_ID=b47a564b62f00aacb837703233ce167f564b350c7ac0410aefdf74a8b72dcbcf \ 
  --env=DRONE_GITEE_CLIENT_SECRET=4719092b810df24633c6f545eb8aaf1c2cefd41afd7cb8ef66abf24429327c02 \
  --env=DRONE_RPC_SECRET=599bac154c0289f087bf50de0a4861b0 \
  --env=DRONE_SERVER_HOST=39.108.140.204:8881 \
  --env=DRONE_SERVER_PROTO=http \
  --publish=8881:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:2



  docker run --detach \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env=DRONE_RPC_PROTO=http \
  --env=DRONE_RPC_HOST=39.108.140.204:8882 \
  --env=DRONE_RPC_SECRET=cc212*******************08f1542b56 \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_RUNNER_NAME=gitea-drone-runner \
  --publish=8882:3000 \
  --restart=always \
  --name=runner \
  drone/drone-runner-docker:1



 docker run --detach --volume=/var/run/docker.sock:/var/run/docker.sock --env=DRONE_RPC_PROTO=http --env=DRONE_RPC_HOST=39.108.140.204:8881 --env=DRONE_RPC_SECRET=599bac154c0289f087bf50de0a4861b0 --env=DRONE_RUNNER_CAPACITY=2 --env=DRONE_RUNNER_NAME=drone --publish=8882:3000 --restart=always --name=runner drone/drone-runner-docker:1
 保存：level=error msg="cannot ping the remote server" error="Post \"http://drone_dev.luocheng.fun/rpc/v2/ping\": dial tcp 39.108.140.204:80: connect: connection refused"， 如何解决


docker run --detach --env=DRONE_RPC_PROTO=http --env=DRONE_RPC_HOST=39.108.140.204:8881 --env=DRONE_RPC_SECRET=599bac154c0289f087bf50de0a4861b0 --publish=8883:3000 --restart always --name runnerssh drone/drone-runner-ssh