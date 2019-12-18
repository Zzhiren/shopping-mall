/**
 * @file 请求验证路由
 * @author 钱凯行 2019.12.18
 */
const router = require('koa-router')()
const AuthController  = require('../controller/auth');

/** 一级路由名称 */
router.prefix('/auth');

/** 二级路由 */
router.all('/account', AuthController.authAccount);                                 // 验证账号是否正确
router.all('/loginbyaccountpasswrod', AuthController.loginByAccountAndPassword);    // 通过账号密码登录
module.exports = router;
