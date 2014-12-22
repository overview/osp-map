

gulp = require('gulp')
less = require('gulp-less')


gulp.task 'less', ->
  gulp.src('./less/index.less')
    .pipe(less())
    .pipe(gulp.dest('dist'))
