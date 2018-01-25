gulp = require 'gulp'
sass = require 'gulp-sass'
parcel = require 'gulp-parcel'
rev = require 'gulp-rev'
revReplace = require 'gulp-rev-replace'
revDel = require 'rev-del'
sequence = require 'run-sequence'
del = require 'del'
vinylPaths = require 'vinyl-paths'

gulp.task 'build:sass', () ->
  gulp.src 'source/stylesheets/**/*.scss'
    .pipe sass({
      includePaths: ['node_modules/bootstrap/scss/']
    })
    .pipe gulp.dest('build/stylesheets/')

gulp.task 'build:js', () ->
  gulp.src 'source/javascripts/all.js', {read:false}
    .pipe parcel()
    .pipe gulp.dest('build/javascripts/')

gulp.task 'build', ['build:sass', 'build:js']

gulp.task 'rev', () ->
  gulp.src ['build/**/*.+(js|css|png|gif|jpg|jpeg|svg|woff|ico)', '!build/**/*-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]*.+(js|css|png|gif|jpg|jpeg|svg|woff|ico)']
    .pipe rev()
    .pipe gulp.dest 'build/'
    .pipe rev.manifest('rev-manifest.json')
    .pipe revDel({ dest: 'build/'})
    .pipe gulp.dest('build/')

gulp.task 'rev:replace', () ->
  manifest = gulp.src 'build/rev-manifest.json'
  gulp.src 'build/**/*.+(html|css|js)'
    .pipe revReplace(manifest: manifest)
    .pipe gulp.dest('build/')

gulp.task 'rev:clean', () ->
  gulp.src ['build/**/*.+(js|css|png|gif|jpg|jpeg|svg|woff|ico)', '!build/**/*-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]*.+(js|css|png|gif|jpg|jpeg|svg|woff|ico)']
    .pipe(vinylPaths(del))

gulp.task 'post', () -> 
  sequence 'rev', 'rev:replace', 'rev:clean'
