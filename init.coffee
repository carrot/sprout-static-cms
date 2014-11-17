contentful = require 'contentful-management'

set_up_contentful = (sprout) ->
  console.log(contentful)

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
    name: 'contentful_token',
    message: 'What is your Contentful access token?'
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

exports.before_render = (sprout, done) ->
  set_up_contentful()
  done()
