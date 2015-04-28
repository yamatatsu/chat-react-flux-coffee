gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
browserify  = require 'browserify'
coffeeify   = require 'coffeeify'
vinylTransform = require 'vinyl-transform'
del         = require 'del'
runSequence = require 'run-sequence'


# 削除してくれる人
gulp.task 'clean', (cb) ->
	del ['build/*'], cb

gulp.task 'js', ->
	gulp.src './src-front/js/*.js'
		.pipe plumber()
		.pipe vinylTransform (filename) ->
			return browserify filename
				.transform babelify
				.bundle()
		.pipe gulp.dest './build/public/js'


# 監視→ビルドしてくれる人
gulp.task 'watch', ->
	gulp.watch './src-front/js/**/*.js', ['js']
	gulp.watch './src-front/scss/**/*.sass', ['css']

# ビルド。heroku用
gulp.task 'deploy', (callback) ->
  return runSequence 'clean', 'js', callback

# ビルドしつつ監視
gulp.task 'default', (callback) ->
  return runSequence 'deploy', 'watch', callback

##########
# server
# nodemon = require 'gulp-nodemon'
# gulp.task 'serve', ->
#   nodemon script: 'index.js'
# 		.on 'restart', -> console.log 'restarted!'
