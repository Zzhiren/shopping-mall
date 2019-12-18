/**
 * @file 路由入口文件，集中管理./routes目录下的路由子文件
 * @author 钱凯行 2019.12.16
 */

 /** 引入的路由文件 */
const routeList = [
  require('./routes/index'),    // index路由文件
  require('./routes/user'),     // 用户管理路由文件
  require('./routes/auth'),     // 用户管理路由文件
]

/**
 * @description 路由初始化函数
 * @returns {*}
 * @param app
 */
module.exports = app => {
  routeList.map(router => {
    app.use(router.routes(), router.allowedMethods())  // 注册路由
  })
};
