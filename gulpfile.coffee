gulp = require 'gulp'
$ = require('gulp-load-plugins')()
sh = require 'shelljs'
bower = require 'bower'

paths =
  stylus: ['./client/**/*.styl']
  coffee: ['./client/**/*.coffee']
  jade: ['./client/**/*.jade']
  assets: ['./client/**/*.otf', './client/**/*.png', './client/**/*.jpg', './client/**/*.svg']

gulp.task 'default', ['stylus', 'coffee', 'jade', 'copy', 'watch']

gulp.task 'stylus', ->
  gulp.src paths.stylus
  .pipe $.stylus()
  .on 'error', $.util.log
  .pipe gulp.dest './www'

gulp.task 'coffee', ->
  gulp.src paths.coffee
  .pipe $.coffee bare: true
  .pipe $.concat 'app.js'
  .on 'error', $.util.log
  .pipe gulp.dest './www/js/'

gulp.task 'jade', ->
  gulp.src paths.jade
  .pipe $.jade
    pretty: true
    doctype: 'html'
  .on 'error', $.util.log
  .pipe gulp.dest './www'

gulp.task 'copy', ->
  gulp.src paths.assets
  .pipe $.copy './www', prefix: 1
  .on 'error', $.util.log

gulp.task 'watch', ->
  gulp.watch paths.stylus, ['stylus']
  gulp.watch paths.coffee, ['coffee']
  gulp.watch paths.jade, ['jade']
  gulp.watch paths.assets, ['copy']

gulp.task 'install', ['git-check'], ->
  bower.commands.install()
  .on 'log', (data) ->
    $.util.log 'bower', $.util.colors.cyan data.id, data.message

gulp.task 'git-check', (done) ->
  if not sh.which 'git'
    console.log '  ' + $.util.colors.red('Git is not installed.'),
    '\n  Git, the version control system, is required to download Ionic.',
    '\n  Download git here:', $.util.colors.cyan('http://git-scm.com/downloads') + '.',
    '\n  Once git is installed, run \'' + $.util.colors.cyan('gulp install') + '\' again.'
    process.exit 1
  done()
