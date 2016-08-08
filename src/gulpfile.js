#!/usr/bin/env node
var config = require('./config.js');

var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
var lr = require('tiny-lr')();
var path = require('path');
var fs = require('fs-extra');

var dir = path.dirname(path.dirname(config.projectWar())) + '/src/main/webapp';

gulp.task('default', function () {
    console.log('go to http://localhost:8126/');
    nodemon({
      script: 'server.js'
    })
    .on('restart', function () {
        console.log('restarted!')
    });

    lr.listen(35729);

    gulp.watch(dir + '/**/*', function(event){
        if(fs.lstatSync(event.path).isFile()) {
            console.log('event.path:', event.path);

            lr.changed({
              body: {
                files: [event.path]
              }
            });
        }
    });
});
