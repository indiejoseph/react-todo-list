'use strict'

gulp = require 'gulp'
$ = require('gulp-load-plugins')()
browserSync = require 'browser-sync'
handleErrors = require '../util/handle_errors'
{ reload } = browserSync

isDev  = yes
isProd = no
if process.env.NODE_ENV is 'production'
  isDev  = no
  isProd = yes

sassDest = './demo/css'

gulp.task 'styles', ->
  gulp.src ['./src/styles/*.sass', './src/styles/*.scss']
    .pipe $.sass({ sourceComments : 'normal' })
      .on('error', handleErrors)
    .pipe $.autoprefixer('last 1 version', '> 1%')
    .pipe $.minifyCss()
    .pipe gulp.dest(sassDest)
    .pipe reload({ stream: yes })
