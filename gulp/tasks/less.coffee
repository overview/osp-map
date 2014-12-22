

gulp = require('gulp')
rename = require('gulp-rename')
less = require('gulp-less')
minify = require('gulp-minify-css')
sourcemaps = require('gulp-sourcemaps')
argv = require('yargs').argv
gulpif = require('gulp-if')
config = require('../config')


gulp.task 'less', ->
  gulp.src('./public/stylesheets/index.less')
    .pipe(sourcemaps.init())
    .pipe(less())
    .pipe(gulpif(argv.min, minify()))
    .pipe(rename('style.css'))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(config.dist))
