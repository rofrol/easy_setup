#!/usr/bin/env node

require('dotenv').config();
var config = require('./config.js');
var chdir = require('./chdir');
require('shelljs/global');

var users = function() {
  var users = exec('echo exit', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM + ' @oracle/users.sql', {silent:true}).stdout;
  users = users.replace(/\r\n\r\n/g, '').split('\r\n');
  users.splice(-1, 1);
  // console.log('users:', users);
  
  var keys = [
    'PA',
    'PAWORK',
    'PAAB',
    'PAABWORK',
    'PARTT',
    'PARTTWORK'
  ];
  
  var usersObj = keys.reduce(function(acc, elem) {
    acc[elem] = users.indexOf(elem) !== -1;
    return acc;
  }, {});

  // console.log('usersObj:', usersObj);

  return usersObj; 
}


function dropUserIfExists(user) {
  if(users()[user]) {
    exec('echo DROP USER ' + user + ' CASCADE;', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM);
  }
}

module.exports = {
  users: users,
  dropUserIfExists: dropUserIfExists 
};
