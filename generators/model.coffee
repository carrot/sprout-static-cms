path       = require 'path'
contentful = require 'contentful-management'

log = console.log.bind(console)

module.exports = (utils, name) ->
  cwd    = process.cwd()
  config = require(path.join(cwd, 'contentful'))
  client = contentful.createClient(accessToken: config.management_token)

  client.getSpace(config.space_id)
    .then (space) ->
      space.createContentType
        name: name
    .then(log.ok, log.fail)
