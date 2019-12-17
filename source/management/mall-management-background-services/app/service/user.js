/**
 * @file 用户相关逻辑
 */
 class UserService {
   async getUserList (ctx, next) {
    let sql = 'select * from user_info;';
    return await ctx.mallQuery(sql);
   }
 }

module.exports = new UserService();