require('dotenv').config({path: '../.env'});
var ORACLE_HOSTNAME = process.env.ORACLE_HOST + ':' + process.env.ORACLE_PORT + '/' + process.env.ORACLE_SID_NAME;
var DB = 'sqlplus -s system/' + process.env.ORACLE_SYSTEM_PASSWORD + '@' + ORACLE_HOSTNAME;

module.exports = {
  ORACLE_HOSTNAME: ORACLE_HOSTNAME,
  DB: DB
};
