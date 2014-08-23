### 
author phuc
email phuccntt1990@gmail.com
###
fileJs = [
	'js/jquery-1.11.1.min.js',
  'js/bootstrap.min.js',

]
fileCss = [
  'css/bootstrap.min.css',
  'css/bootstrap-responsive.min.css',
  'css/main.css'
]
module.exports = (grunt) ->
  grunt.initConfig 
    pkg:grunt.file.readJSON('package.json')
    'sails-linker': 
      devJs:
        options:
          startTag:'<!--SCRIPTS-->'
          endTag:'<!--SCRIPTS END-->'
          fileTmpl:'<script src="%s"></script>'
          appRoot:'app/'
        files:
          # target-script
          'index.html': [fileJs]
      devCss:
        options:
          startTag:'<!--STYLE-->'
          endTag:'<!--STYLE END-->'
          fileTmpl:'<link rel="stylesheet" href="%s">'
          appRoot:'app'
        files:
          # target out put
          'index.html':[fileCss]
    'less':
      development:
        options:
          paths:['css']
	         dumpLineNumbers:'comments'
        files:
          'css/main.css': 'less/style.less'
          
    'watch':
      less:
        files:['less/**/*.less']
        tasks:['less']
        options:
          reload:true
  grunt.loadNpmTasks 'grunt-sails-linker'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.registerTask 'default', ['sails-linker','watch:less']

  return