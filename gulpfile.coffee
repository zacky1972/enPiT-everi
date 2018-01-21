gulp = require 'gulp'
parcel = require 'gulp-parcel'

gulp.task 'build', () ->
  gulp.src 'build/index.html', {read:false}
    .pipe parcel({outDir: 'dist', publicURL: './'}, {source: 'build'})
    .pipe gulp.dest('dist')
