

gulp = require('gulp')
del = require('del')
config = require('../config').clean


gulp.task 'clean', ->
  del(config.dest)
