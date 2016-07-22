
// https://github.com/substack/node-chdir
module.exports = chdir;

function chdir (dir, cb) {
    if(typeof dir === 'undefined') {
        console.log('Cannot cd to undefined');
        process.exit(1);
    }
    
    chdir.push();

    try {
      process.chdir(dir);
    }
    catch (err) {
      console.log('chdir: ' + err);
      console.log('dir:', dir);
    }

    if (cb) cb();
    chdir.pop();
};
chdir.stack = [];

chdir.push = function (dir) {
    chdir.stack.push(dir === undefined ? process.cwd() : dir);
};

chdir.pop = function () {
    var dir = chdir.stack.shift();
    if (dir !== undefined) process.chdir(dir);
};
