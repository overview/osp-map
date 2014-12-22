

gulp = require('gulp')


# Load tasks from /gulp.
require('require-dir')('./gulp')


gulp.task 'dev', ['browserify', 'less'], ->
  gulp.watch('less/*.less', ['less'])
