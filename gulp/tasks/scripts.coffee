'use strict'

$ = require('gulp-load-plugins')()
gulp = require 'gulp'

gulp.task 'scripts', ->
	gulp.src './src/scripts/*.coffee'
	.pipe $.concat 'score_reader.coffee'
	.pipe $.coffee { bare: true }
	.pipe gulp.dest 'dist/'
	.pipe $.uglify()
	.pipe $.rename { suffix: '.min' }
	.pipe $.coffee { bare: true }
	.pipe gulp.dest 'dist/'
