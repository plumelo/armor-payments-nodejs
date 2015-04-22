module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib'
        ext: '.js'
    coffeelint:
      options:
        'max_line_length':
          value: 120
          level: 'error'
          limitComments: true
      app: ['src/*.coffee', 'src/**/*.coffee']
      test: ['test/*.coffee', 'test/**/*.coffee']
    mochaTest:
      options:
        reporter: 'nyan'
      src: ['test/*.test.coffee', 'test/**/*.test.coffee']

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'default', ['coffee', 'coffeelint', 'mochaTest']
