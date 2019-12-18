/**
 * @file 系统管理数据库连接函数封装
 */
const mysql = require('mysql');
const systemDataBaseConf = require('../config/base.conf').systemDataBase;
const logger = require('koa-logger')

/** @function 建立数据库连接 */
const pool = mysql.createPool({
  host: systemDataBaseConf.host,
  user: systemDataBaseConf.user,
  password: systemDataBaseConf.password,
  database: systemDataBaseConf.database,
  connectionLimit: systemDataBaseConf.connectionLimit,
  queueLimit: systemDataBaseConf.queueLimit,
  acquireTimeout: 1000 * 600,
  charset: systemDataBaseConf.charset,
  multipleStatements: true,
  timezone: '+8:00'
});

/**
 * @description 商城数据库sql执行函数封装
 * @param {string} sql - 需要执行的sql语句
 * @param {Object[] | string} values - 参数
 * @returns {Promise}
 */
exports.systemQuery = (sql, values='') => {
  console.log(mysql.format(sql, values))
  return new Promise ((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        reject(err);
      } else {
        connection.query(mysql.format(sql, values), (err, rows) => {
          if (err) {
            console.error('sql');
            console.log(err);
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