#!/usr/bin/env node
var config = require('./config.js');
var fs = require('fs-extra');
var path = require('path');
var helper = require('./helper.js');

//************************************************************************
// Some fs operations
//************************************************************************

// Why it needs pa?
fs.mkdirsSync(process.env.BUNDLER_DOCUMENTPOOLDIRECTORYPATH);

fs.copySync('modules', path.resolve(process.env.JBOSS_HOME, 'modules'), {clobber: true});
fs.copySync('modules', path.resolve(process.env.JBOSS_HOME_RTT, 'modules'), {clobber: true});
fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');

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


var standalone = fs.readFileSync('jboss/standalone-' + process.env.JBOSS_VERSION + '.xml', 'utf8');

standalone = standalone
    .replace(/            <bindings><\/bindings>/g, bindings.join('\n'))
    .replace(/                <datasource><\/datasource>/g, datasources.join('\n'))
    .replace(new RegExp('"/projects/xbg-pa/config/localConfigExample"', 'g'), '"' + path.dirname(process.env.PA_CONFIG) + '"')
    .replace(new RegExp('"/projects/xbg-rtt/config/local"', 'g'), '"' + path.dirname(process.env.PA_CONFIG) + '"')
    .replace(new RegExp('"/projects/xbg-pa-adminbox/config/local"', 'g'), '"' + path.dirname(process.env.ADMINBOX_CONFIG) + '"')
    .replace(/localhost:1521:XE/, config.ORACLE_HOSTNAME);

// standalone_pa

fs.outputFileSync(process.env.JBOSS_HOME + '/standalone/configuration/standalone.xml', standalone, 'utf8');

// standalone_rtt

var standalone_rtt = standalone.replace(
    new RegExp('<socket-binding name="http" port="8080"/>', 'g'),
    '<socket-binding name="http" port="' + process.env.JBOSS_PORT_RTT + '"/>'
);

standalone_rtt = standalone_rtt.replace(new RegExp('jboss\.management\.native\.port:9999', 'g'), 'jboss.management.native.port:9989');
standalone_rtt = standalone_rtt.replace(new RegExp('jboss\.management\.http\.port:9990', 'g'), 'jboss.management.http.port:9980');
standalone_rtt = standalone_rtt.replace(new RegExp('<socket-binding name="remoting" port="4447"/>', 'g'), '<socket-binding name="remoting" port="4437"/>');

fs.outputFileSync(process.env.JBOSS_HOME_RTT + '/standalone/configuration/standalone.xml', standalone_rtt, 'utf8');

var out

//************************************************************************
// PA config
//************************************************************************

out = fs.readFileSync(process.env.PA_CONFIG_BASE, 'utf8');

out = helper.updateValueFromEnv(out, 'rtt.enabled');
out = helper.updateValueFromEnv(out, 'contentDirectory.current');
out = helper.updateValueFromEnv(out, 'contentDirectory.upload');
out = helper.updateValueFromEnv(out, 'mappingRegelnDirectory.upload');
out = helper.updateValueFromEnv(out, 'adminboxUploadDirectory');
out = helper.updateValueFromEnv(out, 'bundler.documentPoolDirectoryPath');
out = helper.replaceValue(out, 'rtt.rest.service.url', 'http://localhost:' + process.env.JBOSS_PORT_RTT + '/xbg-rtt-web/rest');
out = helper.replaceValue(out, 'mappingRegelnDirectory.upload', '/mlp_temp/pa-bundlers-configuration');

fs.outputFileSync(process.env.PA_CONFIG, out, 'utf8');

//************************************************************************
// RTT config
//************************************************************************

out = fs.readFileSync(process.env.RTT_CONFIG_BASE, 'utf8');

out = helper.updateValueFromEnv(out, 'disable-auth-filter');

if(process.env.PA_ENABLED === 'true') {
    out = helper.replaceValue(out, 'paServer.url', helper.valueFromEnv('host-name'));
} else {
    out = helper.replaceValue(out, 'paServer.url', process.env['REMOTE_HOST_NAME']);
}

out = helper.replaceValue(out, 'host-name', 'http://localhost:' + process.env.JBOSS_PORT_RTT);

fs.outputFileSync(process.env.RTT_CONFIG, out, 'utf8');


//************************************************************************
// Adminbox PA config
//************************************************************************

out = fs.readFileSync(process.env.ADMINBOX_CONFIG_BASE, 'utf8');

// causes problems for adminbox
// out = helper.updateValueFromEnv(out, 'disable-auth-filter');
out = helper.replaceValue(out, 'releaseDirectory', helper.valueFromEnv('adminboxUploadDirectory'));
out = helper.replaceValue(out, 'transportDirectory', helper.valueFromEnv('adminboxUploadDirectory') + '/export');
out = helper.updateValueFromEnv(out, 'host-name');
out = helper.replaceValue(out, 'storage.flyway.admin.datasource.url', 'jdbc:oracle:thin:@' + config.ORACLE_HOSTNAME);
out = helper.replaceValue(out, 'storage.flyway.admin.datasource.driver', 'oracle.jdbc.OracleDriver');
out = helper.updateValueFromEnv(out, 'storage.flyway.admin.datasource.username');
out = helper.updateValueFromEnv(out, 'storage.flyway.admin.datasource.password');
out = helper.replaceValue(out, 'storage.flyway.application.datasource.url', 'jdbc:oracle:thin:@' + config.ORACLE_HOSTNAME);
out = helper.replaceValue(out, 'storage.flyway.application.datasource.driver', 'oracle.jdbc.OracleDriver');
out = helper.updateValueFromEnv(out, 'storage.flyway.application.datasource.username');
out = helper.updateValueFromEnv(out, 'storage.flyway.application.datasource.password');
out = helper.updateValueFromEnv(out, 'feature.export.available');
out = helper.updateValueFromEnv(out, 'feature.transport.available');
out = helper.updateValueFromEnv(out, 'feature.import.available');

if(process.env.PA_ENABLED === 'true') {
    out = helper.replaceValue(out, 'paServer.url', helper.valueFromEnv('host-name'));
} else {
    out = helper.replaceValue(out, 'paServer.url', process.env['REMOTE_HOST_NAME']);
}


fs.outputFileSync(process.env.ADMINBOX_CONFIG, out, 'utf8');

// http://stackoverflow.com/questions/10058814/get-data-from-fs-readfile/14078644#14078644
// http://stackoverflow.com/questions/14177087/replace-a-string-in-a-file-with-nodejs
// Tips for Writing Portable Node.js Code https://gist.github.com/domenic/2790533
// http://stackoverflow.com/questions/34329149/nodejs-absolute-paths-in-windows-with-forward-slash
// http://stackoverflow.com/questions/5172183/javascript-new-regexp-from-string
// http://stackoverflow.com/questions/5469641/regex-javascript-why-dot-and-comma-are-matching-for
// http://stackoverflow.com/questions/6603015/check-whether-a-string-matches-a-regex
// http://stackoverflow.com/questions/14918939/match-the-start-of-each-new-line-with-javascript-regex
