// const { defineConfig } = require('@vue/cli-service')
// module.exports = defineConfig({
//   transpileDependencies: true,
// })
module.exports = {
  devServer: {
    port: 8888, //前端服务启动的端口号
    host: 'localhost', //前端服务启动后的访问ip，默认为localhost, host和port组成了前端服务启动后的访问入口。
    https: false,
    //open: true,
    headers: {
      "Access-Control-Allow-Origin": "*"
    },
    // proxy: {
    //   '/proxyApi': {//请求前缀，有这个前缀(紧跟端口号)的才会走代理
    //     target: 'http://localhost:8080/renren-fast',//后端的接口
    //     ws: false,
    //     changeOrigin: true,
    //     pathRewrite:{
    //       '^/proxyApi': ''
    //     },
    //   },
    // },

  }
}