require('dotenv').config({path: '../.env'});

var fs = require('fs-extra');
var path = require('path');

//************************************************************************
// Some fs operations
//************************************************************************

// Why it needs pa?
fs.mkdirsSync(process.env.BUNDLER_DOCUMENTPOOLDIRECTORYPATH);

fs.copySync('modules', path.resolve(process.env.JBOSS_HOME, 'modules'), {clobber: true});
fs.removeSync(path.resolve(process.env.JBOSS_HOME, 'standalone/deployments/*.war*'));

//************************************************************************
// standalone.xml
//************************************************************************

var bindings = ['            <bindings>', fs.readFileSync('jboss/bindings_shared.xml', 'utf8')];
var datasources = [];

if(process.env.PA_ENABLED === 'true' || process.env.ADMINBOX_ENABLED === 'true') {
    bindings.push(fs.readFileSync('jboss/bindings_pa_adminbox.xml', 'utf8'));
}
if(process.env.PA_ENABLED === 'true') {
    datasources.push(fs.readFileSync('jboss/datasource_pa.xml', 'utf8'));
}
if(process.env.ADMINBOX_ENABLED === 'true') {
    datasources.push(fs.readFileSync('jboss/datasource_adminbox.xml', 'utf8'));
}
if(process.env.RTT_ENABLED === 'true') {
    bindings.push(fs.readFileSync('jboss/bindings_rtt.xml', 'utf8'));
    datasources.push(fs.readFileSync('jboss/datasource_rtt.xml', 'utf8'));
}

bindings.push('            </bindings>');


var db = require('./db.js');
var standalone = fs.readFileSync('jboss/standalone-' + process.env.JBOSS_VERSION + '.xml', 'utf8');

standalone = standalone
    .replace(/            <bindings><\/bindings>/g, bindings.join('\n'))
    .replace(/                <datasource><\/datasource>/g, datasources.join('\n'))
    .replace(new RegExp('"/projects/xbg-pa/config/localConfigExample"', 'g'), '"' + path.dirname(process.env.PA_CONFIG) + '"')
    .replace(new RegExp('"/projects/xbg-rtt/config/local"', 'g'), '"' + path.dirname(process.env.PA_CONFIG) + '"')
    .replace(new RegExp('"/projects/xbg-adminbox/config/local"', 'g'), '"' + path.dirname(process.env.ADMINBOX_CONFIG) + '"')
    .replace(/localhost:1521:XE/, db.ORACLE_HOSTNAME);

fs.outputFileSync(process.env.JBOSS_HOME + '/standalone/configuration/standalone.xml', standalone, 'utf8');

var config

//************************************************************************
// PA config
//************************************************************************

config = fs.readFileSync(process.env.PA_CONFIG_BASE, 'utf8');

config = updateValueFromEnv(config, 'rtt.enabled');
config = updateValueFromEnv(config, 'contentDirectory.current');
config = updateValueFromEnv(config, 'contentDirectory.upload');
config = updateValueFromEnv(config, 'mappingRegelnDirectory.upload');
config = updateValueFromEnv(config, 'adminboxUploadDirectory');
config = updateValueFromEnv(config, 'bundler.documentPoolDirectoryPath');

fs.outputFileSync(process.env.PA_CONFIG, config, 'utf8');

//************************************************************************
// RTT config
//************************************************************************

config = fs.readFileSync(process.env.RTT_CONFIG_BASE, 'utf8');

config = updateValueFromEnv(config, 'disable-auth-filter');

if(process.env.PA_ENABLED === 'true') {
    config = replaceValue(config, 'paServer.url', valueFromEnv('host-name'));
} else {
    config = replaceValue(config, 'paServer.url', .process.env['REMOTE-HOST-NAME']);
}

fs.outputFileSync(process.env.RTT_CONFIG, config, 'utf8');


//************************************************************************
// Adminbox PA config
//************************************************************************

config = fs.readFileSync(process.env.ADMINBOX_CONFIG_BASE, 'utf8');

config = updateValueFromEnv(config, 'disable-auth-filter');
config = replaceValue(config, 'releaseDirectory', valueFromEnv('adminboxUploadDirectory'));
config = replaceValue(config, 'transportDirectory', valueFromEnv('adminboxUploadDirectory') + '/export');
config = updateValueFromEnv(config, 'host-name');
config = replaceValue(config, 'storage.flyway.admin.datasource.url', 'jdbc:oracle:thin:@' + db.ORACLE_HOSTNAME);
config = replaceValue(config, 'storage.flyway.admin.datasource.driver', 'oracle.jdbc.OracleDriver');
config = updateValueFromEnv(config, 'storage.flyway.admin.datasource.username');
config = updateValueFromEnv(config, 'storage.flyway.admin.datasource.password');
config = replaceValue(config, 'storage.flyway.application.datasource.url', 'jdbc:oracle:thin:@' + db.ORACLE_HOSTNAME);
config = replaceValue(config, 'storage.flyway.application.datasource.driver', 'oracle.jdbc.OracleDriver');
config = updateValueFromEnv(config, 'storage.flyway.application.datasource.username');
config = updateValueFromEnv(config, 'storage.flyway.application.datasource.password');
config = updateValueFromEnv(config, 'feature.export.available');
config = updateValueFromEnv(config, 'feature.transport.available');
config = updateValueFromEnv(config, 'feature.import.available');

if(process.env.PA_ENABLED === 'true') {
    config = replaceValue(config, 'paServer.url', valueFromEnv('host-name'));
} else {
    config = replaceValue(config, 'paServer.url', .process.env['REMOTE-HOST-NAME']);
}


fs.outputFileSync(process.env.ADMINBOX_CONFIG, config, 'utf8');


//************************************************************************
// Helper functions
//************************************************************************

function updateValueFromEnv(string, key) {
    return replaceValue(string, key, valueFromEnv(key));
}

function replaceValue(string, key, value) {
    var regex = new RegExp('^\\s*#?\\s*' + key.replace(/\./g, '\\.') + '\\s*=.*', 'gm');
    if(!regex.test(string)) {
      console.log('Failed to replace regex: ' + regex + ' with value: ' + value);
      process.exit(1);
    }
    return string.replace(regex, key + ' = ' + value);
}

function envifyKey(key) {
    return key.toUpperCase().replace(/\./g, '_');
}

function valueFromEnv(key) {
    var value = process.env[envifyKey(key)];
    if(typeof value === 'undefined') {
        console.log('Failed to get value for key: ' + key + ' from env');
        process.exit(1);
    }
    return value;
}

// http://stackoverflow.com/questions/10058814/get-data-from-fs-readfile/14078644#14078644
// http://stackoverflow.com/questions/14177087/replace-a-string-in-a-file-with-nodejs
// Tips for Writing Portable Node.js Code https://gist.github.com/domenic/2790533
// http://stackoverflow.com/questions/34329149/nodejs-absolute-paths-in-windows-with-forward-slash
// http://stackoverflow.com/questions/5172183/javascript-new-regexp-from-string
// http://stackoverflow.com/questions/5469641/regex-javascript-why-dot-and-comma-are-matching-for
// http://stackoverflow.com/questions/6603015/check-whether-a-string-matches-a-regex
// http://stackoverflow.com/questions/14918939/match-the-start-of-each-new-line-with-javascript-regex
