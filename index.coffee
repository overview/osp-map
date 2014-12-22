

express = require('express')


app = express()

# Configure Express.
require('./config/express')(app)

# Register routes.
require('./config/routes')(app)

module.exports = app
