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
    var envified = key.toUpperCase().replace(/[.-]/g, '_');
    return envified;
}

function valueFromEnv(key) {
    var value = process.env[envifyKey(key)];
    if(typeof value === 'undefined') {
        console.log('Failed to get value for key: ' + key + ' from env');
        process.exit(1);
    }
    return value;
}

module.exports = {
  updateValueFromEnv: updateValueFromEnv,
  replaceValue: replaceValue,
  envifyKey: envifyKey,
  valueFromEnv: valueFromEnv
};
