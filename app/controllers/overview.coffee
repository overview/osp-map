

exports.metadata = (req, res) ->
  res.status(204).send()


exports.show = (req, res) ->
  res.render('overview/show')
