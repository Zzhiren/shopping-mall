/**
 * @file 商城数据库连接函数封装
 */
const mysql = require('mysql');
const mallDataBaseConf = require('../config/base.conf').mallDataBase;
const logger = require('koa-logger')

/** @function 建立数据库连接 */
const pool = mysql.createPool({
  host: mallDataBaseConf.host,
  user: mallDataBaseConf.user,
  password: mallDataBaseConf.password,
  database: mallDataBaseConf.database,
  connectionLimit: mallDataBaseConf.connectionLimit,
  queueLimit: mallDataBaseConf.queueLimit,
  acquireTimeout: 1000 * 600,
  charset: mallDataBaseConf.charset,
  multipleStatements: true,
  timezone: '+8:00'
});

/**
 * @description 商城数据库sql执行函数封装
 * @param {string} sql - 需要执行的sql语句
 * @param {Object[] | string} values - 参数
 * @returns {Promise}
 */
exports.mallQuery = (sql, values='') => {
  console.log('mallQuery')
  return new Promise ((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        reject(err);
      } else {
        connection.query(mysql.format(sql, values), (err, rows) => {
          if (err) {
            console.error('sql')
            console.log(err)
            reject(err);
          } else {
            return resolve(rows);
          }
          connection.release()
        })
      }
    })
  });
};