/**
 * @file 路由入口文件，集中管理./routes目录下的路由子文件
 * @author Zzhiren 2019.12.16 
 */

 /** 引入的路由文件 */
const index = require('./routes/index');      // index路由文件
const user = require('./routes/user');        // 用户管理路由文件

/**
 * @description 路由初始化函数
 * @param {any}
 * @returns {*}
 */
module.exports = app => {
  app.use(index.routes(), index.allowedMethods());
  app.use(user.routes(), user.allowedMethods());
}
