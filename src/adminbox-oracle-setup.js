#!/usr/bin/env node
var config = require('./config.js');
require('shelljs/global');

var user = require('./user.js');

// sql

exec('echo exit', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM + ' @oracle/create-tablespaces.sql');

user.dropUserIfExists('PAAB');
user.dropUserIfExists('PAABWORK');
exec('echo exit', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM + ' @oracle/adminbox-users.sql');

// You either use the full path, or exit the script and start sqlplus again from the right directory
// http://stackoverflow.com/questions/509048/sql-plus-change-current-directory/509080#509080
