

gulp = require('gulp')
rename = require('gulp-rename')
less = require('gulp-less')
minify = require('gulp-minify-css')
argv = require('yargs').argv
gulpif = require('gulp-if')
config = require('../config')


gulp.task 'less', ->
  gulp.src('./public/stylesheets/index.less')
    .pipe(less())
    .pipe(gulpif(argv.min, minify()))
    .pipe(rename('style.css'))
    .pipe(gulp.dest(config.dist))
