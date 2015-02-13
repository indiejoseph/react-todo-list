'use strict'

gulp = require 'gulp'
browserify = require 'browserify'
watchify = require 'watchify'
bundleLogger = require '../util/bundle_logger'
handleErrors = require '../util/handle_errors'
source = require 'vinyl-source-stream'
browserSync = require 'browser-sync'
$ = require('gulp-load-plugins')()
{ reload } = browserSync

dest = './demo/js'

isDev  = yes
isProd = no

if process.env.NODE_ENV is 'production'
  isDev  = no
  isProd = yes

gulp.task 'browserify', ->
  bundler = browserify
    # Required watchify args
    cache: {}
    packageCache: {}
    fullPaths: no
    # Specify the entry point of your app
    entries: ['./src/scripts/Demo.jsx']
    # Add file extentions to make optional in your requires
    extensions: ['.js', '.jsx']
    # Enable source maps
    debug: isDev

  bundle = ->
    # Log when bundling starts
    bundleLogger.start('app.js')

    return bundler
      .bundle()
      # Report compile errors
      .on 'error', handleErrors
      # Use vinyl-source-stream to make the
      # stream gulp compatible. Specifiy the
      # desired output filename here.
      .pipe source('app.js')
      # Specify the output destination
      .pipe gulp.dest(dest)
      .pipe reload({ stream: yes })
      # Log when bundling completes!
      .on 'end', bundleLogger.end

  if global.isWatching
    bundler = watchify bundler
    # Rebundle with watchify on changes.
    bundler.on 'update', bundle

  return bundle()
