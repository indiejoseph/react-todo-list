express = require 'express'
app     = express()

bodyParser     = require 'body-parser'
errorHandler   = require 'errorhandler'
methodOverride = require 'method-override'

hostname = process.env.HOSTNAME or '0.0.0.0'
port     = parseInt(process.env.PORT, 10) or 3000

app.get '/', (req, res) ->
	res.redirect '/index.html'

app.use methodOverride()
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: yes
app.use express.static __dirname + '/'
app.use express.static __dirname + '/../dist'
app.use errorHandler
	dumpExceptions: yes
	showStack: yes

console.log 'Server listening at http://' + hostname + ':' + port
app.listen port, hostname
