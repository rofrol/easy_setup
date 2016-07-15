require('dotenv').config({path: '../.env'});
require('shelljs/global');

// sql

var db = 'sqlplus -s system/' + process.env.ORACLE_SYSTEM_PASSWORD + '@localhost:1521/xe';
exec('echo drop user paab cascade;').exec(db);
exec('echo drop user paabwork cascade;').exec(db);
exec('echo exit', {silent:true}).exec(db + ' @admninbox-users.sql');
