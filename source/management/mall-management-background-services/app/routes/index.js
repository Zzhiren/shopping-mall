const router = require('koa-router')()

router.get('/', async (ctx, next) => {
  let sql = 'select * from user_info;';
  console.log(sql)
  // await ctx.mallQuery(sql).then(res=>{
  //   ctx.body = res
  // })
  const result = await ctx.mallQuery(sql);
  console.log('result:' + result)
  ctx.body = result;
});

router.get('/string', async (ctx, next) => {
  ctx.body = 'koa2 string'
})

router.get('/json', async (ctx, next) => {
  ctx.body = {
    title: 'koa2 json'
  }
})

module.exports = router
