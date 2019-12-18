/**
 * @desc 用户相关逻辑
 */
const UserService = require('../service/user');
class UserController{
 async getUserList (ctx, next) {
   const userList = await UserService.getUserList(ctx, next)
   ctx.body = userList
 }
}

module.exports = new UserController();