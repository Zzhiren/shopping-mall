/**
 * @file 多环境配置
 * @author Zzhiren 2019.12.16
 */
const development_env = require('./env.development');
const test_env = require('./env.test');

//根据不同的NODE_ENV，输出不同的配置对象，默认输出development的配置对象
module.exports = {
    development: development_env,
    test: test_env
}[process.env.NODE_ENV || 'development']