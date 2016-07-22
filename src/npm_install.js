module.exports = npm_install;

var config = require('./config.js');
require('shelljs/global');
var fs = require('fs-extra');

function npm_install(package) {
  exec('npm root -g', function(status, output) {
    var packages = fs.readdirSync(output.replace(/\n/, ''));
    if (packages.indexOf(package) === -1) {
      var cmd = 'npm i -g ' + package;
      console.log(cmd);
      exec(cmd);
    }
  });
}

// http://stackoverflow.com/questions/31111033/npm-dont-install-module-every-time
// http://stackoverflow.com/questions/17937960/how-to-list-npm-user-installed-packages
// http://stackoverflow.com/questions/14458508/node-js-shell-command-execution/24777113#24777113
// http://stackoverflow.com/questions/2727167/getting-all-filenames-in-a-directory-with-node-js
// install packages only if not already installed somewhere higher https://github.com/npm/npm/issues/4012
