/**
 * @file 用户相关路由
 * @author Zzhiren 2019.12.16 
 */
const router = require('koa-router')()

/** 父级路由名称 */
router.prefix('/users')

/** 根路由 */
router.get('/', function (ctx, next) {
  ctx.body = 'this is a users response!'
})

/** bar路由 */
router.get('/bar', function (ctx, next) {
  ctx.body = 'this is a users/bar response'
})

module.exports = router
