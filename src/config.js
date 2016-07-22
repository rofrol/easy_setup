require('dotenv').config();
var ORACLE_HOSTNAME = process.env.ORACLE_HOST + ':' + process.env.ORACLE_PORT + '/' + process.env.ORACLE_SID_NAME;
var SQLPLUS_AS_SYSTEM = 'sqlplus -s system/' + process.env.ORACLE_SYSTEM_PASSWORD + '@' + ORACLE_HOSTNAME;

function main() {
    var MAIN = process.argv.slice(2)[0];

    if(typeof MAIN === 'undefined') {
        console.log('Specify project as command line argument');
        process.exit(1);
    }

    return MAIN;
}

function projectHome() {
    return process.env[main() + '_HOME']
}

function projectWar() {
    return projectHome() + '/' + process.env[main() + '_WAR'];
}

module.exports = {
  ORACLE_HOSTNAME: ORACLE_HOSTNAME,
  SQLPLUS_AS_SYSTEM: SQLPLUS_AS_SYSTEM,
  projectHome: projectHome,
  projectWar: projectWar
};
