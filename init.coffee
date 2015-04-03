rest = require 'rest'


exports.configure = [
  {
    type: 'input',
    name: 'name',
    message: 'What is the name of your project?'
  },
  {
    type: 'input',
    name: 'description',
    message: 'Describe your project'
  },
  {
    type: 'input',
    name: 'management_token',
    message: "What is your Contentful Managment API token? (we'll fetch your Delivery token for you)"
  },
  {
    type: 'input',
    name: 'space_id',
    message: 'What is your Contentful Space ID?'
  },
  {
    type: 'input',
    name: 'netlify_token',
    message: 'What is your Netlify access token?'
  }
]

exports.beforeRender = (utils, config) ->
  # console.log(config.space_id)
  # console.log(config.management_token)
  rest
    path: "https://api.contentful.com/spaces/#{config.space_id}/api_keys"
    method: "POST"
    headers:
      'Content-Type': 'application/vnd.contentful.management.v1+json'
      'Authorization': "Bearer #{config.management_token}"
    entity: "key=test"
  .then (res) -> console.log(res)

  # rest
    # path: "https://api.contentful.com/spaces/#{config.space_id}/api_keys"
    # params:
      # access_token: config.management_token
  # .then (res) -> console.log(res.entity)


exports.after = ->
  console.log 'Awesome! Your static CMS roots project has been set up and configured. \nTry it out by creating a content type on Contentful, configuring the content type in `app.coffee`, \nand then accessing it in your templates using the `contentful` local variable. To learn more, check out the roots-contentful readme: https://github.com/carrot/roots-contentful'
