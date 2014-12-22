

gulp = require('gulp')
rename = require('gulp-rename')
less = require('gulp-less')


gulp.task 'less', ->
  gulp.src('./less/index.less')
    .pipe(less())
    .pipe(rename('style.css'))
    .pipe(gulp.dest('dist'))
