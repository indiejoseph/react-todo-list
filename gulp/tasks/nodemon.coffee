'use strict'

gulp = require 'gulp'
$ = require('gulp-load-plugins')()
browserSync = require 'browser-sync'
{ reload } = browserSync

BROWSER_SYNC_RELOAD_DELAY = 500

gulp.task 'nodemon', (cb) ->
  called = no
  $.nodemon
    script : './demo/server.coffee'
    ext    : 'html coffee'
    env    :
      'NODE_ENV': 'development'
    ignore : [
      'src/**'
      'gulp/**'
      'gulpfile.coffee'
      'node_modules/**'
      'demo/**'
      'test/**'
    ]
  .on('start', ->
    setTimeout ->
      cb()  unless called
      called = yes
    , BROWSER_SYNC_RELOAD_DELAY
  )
  .on('restart', ->
    console.log 'nodemon restart...'
    setTimeout ->
     reload { stream: no }
    , BROWSER_SYNC_RELOAD_DELAY
  )
