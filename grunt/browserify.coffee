

module.exports =

  options:
    watch: true
    transform: ['coffeeify']
    browserifyOptions:
      debug: true

  dist:
    src: '<%= src %>/javascripts/index.coffee'
    dest: '<%= dest %>/script.js'
