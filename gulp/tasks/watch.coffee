'use strict'

gulp = require 'gulp'
browserSync = require 'browser-sync'
{ reload } = browserSync

gulp.task 'watch', ['setWatch', 'browser-sync'], ->
  gulp.watch ['./src/styles/*.sass', './src/styles/*.scss'], ['styles']
  gulp.watch ['./demo/**/*.css', './demo/*.html'], reload
