const Koa = require('koa');
const app = new Koa();
const views = require('koa-views');
const json = require('koa-json');
const onerror = require('koa-onerror');
const bodyparser = require('koa-bodyparser');
const logger = require('koa-logger');
const mallQuery = require('./db/mall').mallQuery;
const systemQuery = require('./db/system').systemQuery;
const statusCode = require('./config/status.code');
const {  accessLogger,systemLogger, } = require('./config/logger');
const router = require('./app/router');

globalInit();
// error handler
onerror(app);
// 商城数据库和系统数据库调用函数
app.context.mallQuery = mallQuery;
app.context.systemQuery = systemQuery;
// middlewares
app.use(bodyparser({
  enableTypes:['json', 'form', 'text']
}))
app.use(json())
// app.use(logger())
app.use(accessLogger()); //中间件
app.use(require('koa-static')(__dirname + '/app/public'))

app.use(views(__dirname + '/app/views', {
  extension: 'ejs'
}))

// logger
app.use(async (ctx, next) => {
  const start = new Date()
  await next()
  const ms = new Date() - start
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
})

// routes
router(app)

// error-handling
app.on('error', (err, ctx) => {
  console.error('server error', err, ctx)
  systemLogger.error(err);
});

function globalInit() {
  global.mallQuery = mallQuery;       // mysql
  global.systemQuery = systemQuery;   // mysql
  global.statusCode = statusCode;     // 状态码
}

module.exports = app
