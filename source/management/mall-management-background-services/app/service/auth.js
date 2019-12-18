/**
 * @file 用户相关逻辑
 */
class AuthService {
  /**
   * @description 校验账号是否存在
   * @param {string} account - 账号
   * @returns {Promise<void>}
   */
  static async authAccount (account) {
    let sql = 'select * from sys_user_info where account=?;';
    return await systemQuery(sql, account);
  }
}

module.exports = AuthService;