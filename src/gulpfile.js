#!/usr/bin/env node
var config = require('./config.js');

var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
// var server = require('gulp-express');
var lr = require('tiny-lr')();
var path = require('path');

var dir = path.dirname(path.dirname(config.projectWar())) + '/src/main/webapp';

gulp.task('default', function () {
    nodemon({
      script: 'server.js'
    })
    .on('restart', function () {
        console.log('restarted!')
    });

    lr.listen(35729);

    gulp.watch(dir + '/**/*', function(event){
        console.log('event.path:', event.path);
      var fileName = path.relative('3000', event.path);
      lr.changed({
        body: {
          files: [fileName]
        }
      });
    });
});
