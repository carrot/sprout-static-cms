exports.before = (sprout, done) ->
  done()

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
    name: 'bitballoon_token',
    message: 'What is your BitBalloon access token?'
  }
]

exports.after = (sprout, done) ->
  sprout.config_values.space_id = 'xxx'
  console.log(sprout.config_values)
  done()
