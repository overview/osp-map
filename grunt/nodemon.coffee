

fs = require('fs')


module.exports = (grunt, data) ->
  dev:
    script: 'index.coffee'
    options:
      env:
        DEBUG: 'osp'
      callback: (nodemon) ->
        fs.writeFileSync(data.dest+'/.rebooted')
