/**
 * @desc 校验相关逻辑
 */
const AuthService = require('../service/auth');
class AuthController{
  /**
   * @description 校验登录账号是否存在
   * @param ctx
   * @param next
   * @returns {Promise<void>}
   */
  static async authAccount (ctx, next) {
    ctx.body = await AuthService.authAccount(ctx, next);
  }

  /**
   * @description 通过账号密码登录
   * @param ctx
   * @param next
   * @returns {Promise<void>}
   */
  static async loginByAccountAndPassword (ctx, next) {
    let account = ctx.request.body.account;
    let result = await AuthController.checkingAccount(account);
    let resParams = {};
    /* 当长度为0时表示没有改账号 */
    if ( result.length === 0 ) {
      console.log(statusCode)
      resParams = {...statusCode.userDoesNotExist}
    }
    ctx.body = resParams
  }

  static async checkingAccount (account) {
    return await AuthService.authAccount(account);
  }
}

module.exports = AuthController;