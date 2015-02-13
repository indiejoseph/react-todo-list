'use strict'

gulp = require 'gulp'
browserSync = require 'browser-sync'

gulp.task 'browser-sync', ['nodemon'], ->
  browserSync
    proxy  : 'http://localhost:3000'
    port   : 3001
    baseDir: 'public'
    browser: ['google chrome']
    notify : yes
