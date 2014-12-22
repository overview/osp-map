

gulp = require('gulp')


gulp.task 'watch', ->
  gulp.watch('less/*.less', ['less'])
