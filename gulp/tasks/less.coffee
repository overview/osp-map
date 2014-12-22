

gulp = require('gulp')
rename = require('gulp-rename')
less = require('gulp-less')
minify = require('gulp-minify-css')
argv = require('yargs').argv
gulpif = require('gulp-if')
config = require('../config').less


gulp.task 'less', ->
  gulp.src(config.src)
    .pipe(less())
    .pipe(gulpif(argv.min, minify()))
    .pipe(rename('style.css'))
    .pipe(gulp.dest(config.dest))
