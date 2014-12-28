

module.exports =

  options:
    watch: true
    transform: ['coffeeify', 'envify']
    browserifyOptions:
      debug: true
      extensions: '.coffee'

  dist:
    src: '<%= src %>/javascripts/index.coffee'
    dest: '<%= dest %>/script.js'
