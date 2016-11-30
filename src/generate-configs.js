#!/usr/bin/env node
var config = require('./config.js');
config.main();
var fs = require('fs-extra');
var path = require('path');
var helper = require('./helper.js');

//************************************************************************
// Some fs operations
//************************************************************************

// Why it needs pa?
fs.mkdirsSync(process.env.BUNDLER_DOCUMENTPOOLDIRECTORYPATH);

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

// standalone_pa

var standalone = fs.readFileSync('jboss/standalone-' + process.env.JBOSS_VERSION + '.xml', 'utf8');

standalone = standalone
    .replace(/            <bindings><\/bindings>/g, bindings.join('\n'))
    .replace(/                <datasource><\/datasource>/g, datasources.join('\n'))
    .replace(new RegExp('"/projects/xbg-pa/config/localConfigExample"', 'g'), '"' + path.dirname(process.env.PA_CONFIG) + '"')
    .replace(new RegExp('"/projects/xbg-rtt/config/local"', 'g'), '"' + path.dirname(process.env.PA_CONFIG) + '"')
    .replace(new RegExp('"/projects/xbg-pa-adminbox/config/local"', 'g'), '"' + path.dirname(process.env.ADMINBOX_CONFIG) + '"')
    .replace(/localhost:1521:XE/, config.ORACLE_HOSTNAME);


// standalone_rtt

var standalone_rtt = standalone.replace(
    new RegExp('<socket-binding name="http" port="8080"/>', 'g'),
    '<socket-binding name="http" port="' + process.env.JBOSS_PORT_RTT + '"/>'
);

standalone_rtt = standalone_rtt.replace(new RegExp('jboss\.management\.native\.port:9999', 'g'), 'jboss.management.native.port:9989');
standalone_rtt = standalone_rtt.replace(new RegExp('jboss\.management\.http\.port:9990', 'g'), 'jboss.management.http.port:9980');
standalone_rtt = standalone_rtt.replace(new RegExp('<socket-binding name="remoting" port="4447"/>', 'g'), '<socket-binding name="remoting" port="4437"/>');

// standalone_adminbox

var standalone_adminbox = standalone.replace(
    new RegExp('<socket-binding name="http" port="8080"/>', 'g'),
    '<socket-binding name="http" port="' + process.env.JBOSS_PORT_ADMINBOX + '"/>'
);

standalone_adminbox = standalone_adminbox.replace(new RegExp('jboss\.management\.native\.port:9999', 'g'), 'jboss.management.native.port:9988');
standalone_adminbox = standalone_adminbox.replace(new RegExp('jboss\.management\.http\.port:9990', 'g'), 'jboss.management.http.port:9979');
standalone_adminbox = standalone_adminbox.replace(new RegExp('<socket-binding name="remoting" port="4447"/>', 'g'), '<socket-binding name="remoting" port="4436"/>');

//************************************************************************
// application configs
//************************************************************************

//************************************************************************
// PA config
//************************************************************************

var pa_out = fs.readFileSync(process.env.PA_CONFIG_BASE, 'utf8');

pa_out = helper.updateValueFromEnv(pa_out, 'rtt.enabled');
pa_out = helper.updateValueFromEnv(pa_out, 'contentDirectory.current');
pa_out = helper.updateValueFromEnv(pa_out, 'contentDirectory.upload');
pa_out = helper.updateValueFromEnv(pa_out, 'mappingRegelnDirectory.upload');
pa_out = helper.updateValueFromEnv(pa_out, 'adminboxUploadDirectory');
pa_out = helper.updateValueFromEnv(pa_out, 'bundler.documentPoolDirectoryPath');
pa_out = helper.replaceValue(pa_out, 'rtt.rest.service.url', 'http://localhost:' + process.env.JBOSS_PORT_RTT + '/xbg-rtt-web/rest');
pa_out = helper.replaceValue(pa_out, 'mappingRegelnDirectory.upload', '/mlp_temp/pa-bundlers-configuration');


//************************************************************************
// RTT config
//************************************************************************

var rtt_out = fs.readFileSync(process.env.RTT_CONFIG_BASE, 'utf8');

rtt_out = helper.updateValueFromEnv(rtt_out, 'disable-auth-filter');

if(process.env.PA_ENABLED === 'true') {
    rtt_out = helper.replaceValue(rtt_out, 'paServer.url', helper.valueFromEnv('host-name'));
} else {
    rtt_out = helper.replaceValue(rtt_out, 'paServer.url', process.env['REMOTE_HOST_NAME']);
}

rtt_out = helper.replaceValue(rtt_out, 'host-name', 'http://localhost:' + process.env.JBOSS_PORT_RTT);



//************************************************************************
// Adminbox PA config
//************************************************************************

var ab_out = fs.readFileSync(process.env.ADMINBOX_CONFIG_BASE, 'utf8');

// causes problems for adminbox
// ab_out = helper.updateValueFromEnv(ab_out, 'disable-auth-filter');
ab_out = helper.replaceValue(ab_out, 'releaseDirectory', helper.valueFromEnv('adminboxUploadDirectory'));
ab_out = helper.replaceValue(ab_out, 'transportDirectory', helper.valueFromEnv('adminboxUploadDirectory') + '/export');
ab_out = helper.replaceValue(ab_out, 'host-name', helper.valueFromEnv('ADMINBOX_HOST_NAME'));
ab_out = helper.replaceValue(ab_out, 'storage.flyway.admin.datasource.url', 'jdbc:oracle:thin:@' + config.ORACLE_HOSTNAME);
ab_out = helper.replaceValue(ab_out, 'storage.flyway.admin.datasource.driver', 'oracle.jdbc.OracleDriver');
ab_out = helper.updateValueFromEnv(ab_out, 'storage.flyway.admin.datasource.username');
ab_out = helper.updateValueFromEnv(ab_out, 'storage.flyway.admin.datasource.password');
ab_out = helper.replaceValue(ab_out, 'storage.flyway.application.datasource.url', 'jdbc:oracle:thin:@' + config.ORACLE_HOSTNAME);
ab_out = helper.replaceValue(ab_out, 'storage.flyway.application.datasource.driver', 'oracle.jdbc.OracleDriver');
ab_out = helper.updateValueFromEnv(ab_out, 'storage.flyway.application.datasource.username');
ab_out = helper.updateValueFromEnv(ab_out, 'storage.flyway.application.datasource.password');
ab_out = helper.updateValueFromEnv(ab_out, 'feature.export.available');
ab_out = helper.updateValueFromEnv(ab_out, 'feature.transport.available');
ab_out = helper.updateValueFromEnv(ab_out, 'feature.import.available');

if(process.env.PA_ENABLED === 'true') {
    ab_out = helper.replaceValue(ab_out, 'paServer.url', helper.valueFromEnv('host-name'));
} else {
    ab_out = helper.replaceValue(ab_out, 'paServer.url', process.env['REMOTE_HOST_NAME']);
}

//************************************************************************
// Write files
//************************************************************************


if(process.env.MAIN == 'PA') {
  fs.copySync('modules', path.resolve(process.env.JBOSS_HOME, 'modules'), {clobber: true});
  fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
  fs.outputFileSync(process.env.JBOSS_HOME + '/standalone/configuration/standalone.xml', standalone, 'utf8');
  fs.outputFileSync(process.env.PA_CONFIG, pa_out, 'utf8');
} else if(process.env.MAIN == 'ADMINBOX') {
  fs.copySync('modules', path.resolve(process.env.JBOSS_HOME_ADMINBOX, 'modules'), {clobber: true});
  fs.removeSync(process.env.JBOSS_HOME_ADMINBOX + '/standalone/deployments/*.war*');
  fs.outputFileSync(process.env.JBOSS_HOME_ADMINBOX + '/standalone/configuration/standalone.xml', standalone_adminbox, 'utf8');
  fs.outputFileSync(process.env.ADMINBOX_CONFIG, ab_out, 'utf8');
} else  if(process.env.MAIN == 'RTT') {
  fs.copySync('modules', path.resolve(process.env.JBOSS_HOME_RTT, 'modules'), {clobber: true});
  fs.removeSync(process.env.JBOSS_HOME_RTT + '/standalone/deployments/*.war*');
  fs.outputFileSync(process.env.JBOSS_HOME_RTT + '/standalone/configuration/standalone.xml', standalone_rtt, 'utf8');
  fs.outputFileSync(process.env.RTT_CONFIG, rtt_out, 'utf8');
} else {
  console.err('You should provide main application parameter like PA, ADMINBOX, RTT');
  process.exit(1);
}

// http://stackoverflow.com/questions/10058814/get-data-from-fs-readfile/14078644#14078644
// http://stackoverflow.com/questions/14177087/replace-a-string-in-a-file-with-nodejs
// Tips for Writing Portable Node.js Code https://gist.github.com/domenic/2790533
// http://stackoverflow.com/questions/34329149/nodejs-absolute-paths-in-windows-with-forward-slash
// http://stackoverflow.com/questions/5172183/javascript-new-regexp-from-string
// http://stackoverflow.com/questions/5469641/regex-javascript-why-dot-and-comma-are-matching-for
// http://stackoverflow.com/questions/6603015/check-whether-a-string-matches-a-regex
// http://stackoverflow.com/questions/14918939/match-the-start-of-each-new-line-with-javascript-regex
