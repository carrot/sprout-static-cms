path       = require 'path'
_          = require 'lodash'
s          = require 'underscore.string'
contentful = require 'contentful-management'

log = console.log.bind(console)

valid_field_types = [
  "Symbol"
  "Text"
  "Integer"
  "Number"
  "Date"
  "Boolean"
  "Link"
  "Array"
  "Object"
  "Asset"
]

validate_field_type = (type) ->
  if not _.contains(valid_field_types, type)
    throw new Error("#{type} is not a valid Contentful field type")

parse_fields = (fields) ->
  _.reduce fields, (res, field) ->
    split = field.split(':')
    name  = split[0]
    type  = s.capitalize(split[1]) || 'Text'
    validate_field_type(type)
    field_type = {name: name, type: type}
    if type == 'Asset'
      field_type.linkType = type
      field_type.type     = 'Link'
    res.push(field_type)
    return res
  , []

module.exports = (utils, name) ->
  fields = parse_fields(Array.prototype.slice.call(arguments, 2))
  cwd    = process.cwd()
  config = require(path.join(cwd, 'contentful'))
  client = contentful.createClient(accessToken: config.management_token)

  client.getSpace(config.space_id)
    .then (space) ->
      space.createContentType
        name: name
        fields: fields
    .then(log.ok, log.fail)
