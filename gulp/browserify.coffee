

gulp = require('gulp')
gutil = require('gulp-util')
sourcemaps = require('gulp-sourcemaps')
source = require('vinyl-source-stream')
buffer = require('vinyl-buffer')
watchify = require('watchify')
browserify = require('browserify')
argv = require('yargs').argv
uglify = require('gulp-uglify')
gulpif = require('gulp-if')


bundler = watchify(
  browserify('./src/index.coffee'),
  watchify.args
)

bundle = () ->
  bundler
    .transform('coffeeify')
    .bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('dist/script.js'))
    .pipe(buffer())
    .pipe(gulpif(argv.min, uglify()))
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./'))

gulp.task('browserify', bundle)
bundler.on('update', bundle)
