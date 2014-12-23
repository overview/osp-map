

module.exports =
  dev:
    script: 'index.coffee'
    options:
      env:
        NODE_ENV: 'development'
        DEBUG: 'osp'
      ignore: ['public']
