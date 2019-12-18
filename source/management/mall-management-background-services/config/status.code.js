/**
 * @description 接口返回状态码和状态信息
 * @type {{userDoesNotExist: {msg: string, status}, success: {msg: string, status: number}}}
 */
module.exports = {
  success: {
    msg: 'success',
    status: 200
  },
  userDoesNotExist: {
    msg: '用户不存在',
    status: 400
  }
};