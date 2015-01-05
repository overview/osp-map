

express = require('express')
require('express-namespace')


app = express()

# Configure Express.
require('./config/express')(app)

# Register routes.
require('./config/routes')(app)

module.exports = app
