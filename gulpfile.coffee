del         = require 'del'
gulp        = require 'gulp'
glob        = require 'glob'
browserify  = require 'browserify'
source      = require 'vinyl-source-stream'
runSequence = require 'run-sequence'


# 削除してくれる人
gulp.task 'clean', (cb) ->
	del ['build/*'], cb

# jsをビルドしてくれる人
gulp.task 'js', ->
	srcFiles = glob.sync './src/front/js/*.coffee'
	return browserify
			entries: srcFiles
			transform: ['coffee-reactify']
		.bundle()
		.pipe source 'bundle.js'
		.pipe gulp.dest './build/public/js'

# 監視してくれる人
gulp.task 'watch', ->
	gulp.watch './src/front/js/**/*.coffee', ['js']

############
# まとめ

# heroku用
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
