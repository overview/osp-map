

express = require('express')


app = express()

# Configure Express.
require('./config/express')(app)
module.exports = app
