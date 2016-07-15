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

var bindings = ['            <bindings>', fs.readFileSync('jboss_bindings_shared.xml', 'utf8')];
var datasources = [];

if(process.env.PA_ENABLED === 'true' || process.env.ADMINBOX_ENABLED === 'true') {
    bindings.push(fs.readFileSync('jboss_bindings_pa_adminbox.xml', 'utf8'));
}
if(process.env.PA_ENABLED === 'true') {
    datasources.push(fs.readFileSync('jboss_datasource_pa.xml', 'utf8'));
}
if(process.env.ADMINBOX_ENABLED === 'true') {
    datasources.push(fs.readFileSync('jboss_datasource_adminbox.xml', 'utf8'));
}
if(process.env.RTT_ENABLED === 'true') {
    bindings.push(fs.readFileSync('jboss_bindings_rtt.xml', 'utf8'));
    datasources.push(fs.readFileSync('jboss_datasource_rtt.xml', 'utf8'));
}
bindings.push('            </bindings>');

var standaloneBasePath = path.resolve(process.env.JBOSS_VERSION, 'standalone/configuration/standalone.xml');
var standaloneBase = fs.readFileSync(standaloneBasePath, 'utf8');
var standaloneOut = standaloneBase
    .replace(/            <bindings><\/bindings>/g, bindings.join('\n'))
    .replace(/                <datasource><\/datasource>/g, datasources.join('\n'));

var JBOSS_HOME = path.resolve(process.env.JBOSS_HOME);
var standaloneOutPath = path.resolve(JBOSS_HOME, 'standalone/configuration/standalone.xml');
fs.writeFile(standaloneOutPath, standaloneOut, 'utf8', function (err) {
    if (err) return console.log(err);
});

//************************************************************************
// conf
//************************************************************************

var paConfigBasePath = path.resolve(process.env.PA_CONFIG_BASE);
var paConfigOut = fs.readFileSync(paConfigBasePath, 'utf8');

paConfigOut = replace(paConfigOut, 'rtt.enabled');
paConfigOut = replace(paConfigOut, 'contentDirectory.current');
paConfigOut = replace(paConfigOut, 'contentDirectory.upload');
paConfigOut = replace(paConfigOut, 'mappingRegelnDirectory.upload');
paConfigOut = replace(paConfigOut, 'adminboxUploadDirectory');
paConfigOut = replace(paConfigOut, 'bundler.documentPoolDirectoryPath');

var paConfigOutPath = path.resolve(process.env.PA_CONFIG);
fs.writeFile(paConfigOutPath, paConfigOut, 'utf8', function (err) {
    if (err) return console.log(err);
});

//************************************************************************
// Helper functions
//************************************************************************

function replace(string, key) {
    return replaceValue(string, key, valueFromEnv(key));
}

function replaceValue(string, key, value) {
    var regex = new RegExp('^\\s*' + key.replace('.', '\\.') + '\\s*=.*', 'gm');
    //console.log('regex=' + regex);
    //console.log('regex.test(string):' ,regex.test(string));
    return string.replace(regex, key + ' = ' + value);
}

function envifyKey(key) {
    return key.toUpperCase().replace('.', '_');
}

function valueFromEnv(key) {
    return process.env[envifyKey(key)];
}

// http://stackoverflow.com/questions/10058814/get-data-from-fs-readfile/14078644#14078644
// http://stackoverflow.com/questions/14177087/replace-a-string-in-a-file-with-nodejs
// Tips for Writing Portable Node.js Code https://gist.github.com/domenic/2790533
// http://stackoverflow.com/questions/34329149/nodejs-absolute-paths-in-windows-with-forward-slash
// http://stackoverflow.com/questions/5172183/javascript-new-regexp-from-string
// http://stackoverflow.com/questions/5469641/regex-javascript-why-dot-and-comma-are-matching-for
// http://stackoverflow.com/questions/6603015/check-whether-a-string-matches-a-regex
// http://stackoverflow.com/questions/14918939/match-the-start-of-each-new-line-with-javascript-regex
