contentful = require 'contentful-management'
S          = require 'string'
W          = require 'when'

create_example_content_type = (@space) ->
  W(
    @space.createContentType(
      sys: {id: 'blog-post'},
      name: 'Blog Post'
      displayField: 'title'
      fields: [
        {id: 'title', name: 'Title', type: 'Text'}
        {id: 'body', name: 'Body', type: 'Text'}
      ]
    ).then(@space.publishContentType)
  )

create_example_entry = (@type) ->
  W(
    @space.createEntry(@config.content_type_id,
      sys: {id: 'hello-world'}
      fields:
        title: {'en-US': 'Hello World'}
        body: {'en-US': 'Contentful is all set up!'}
    )
  )

set_up_contentful = (sprout) ->
  @client = contentful.createClient
    accessToken: @config.contentful_token

  W(@client.createSpace({name: S(@config.name).humanize().s}))

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
    type: 'confirm',
    name: 'set_up_contentful',
    message: 'Do you want sprout to set up a new Contentful space with an example content type and entry set up?'
  },
  {
    type: 'input',
    name: 'space_id',
    message: 'What is your Contentful Space ID? (Leave blank if you sprout is setting this up for you)'
  },
  {
    type: 'input',
    name: 'netlify_token',
    message: 'What is your Netlify access token?'
  }
]

exports.before_render = (sprout, done) ->
  if sprout.config_values.set_up_contentful
    ctx = {config: sprout.config_values}
    set_up_contentful.call(ctx, sprout).with(ctx)
      .tap((space) -> @config.space_id = space.sys.id)
      .then(create_example_content_type)
      .tap((type) -> @config.content_type_id = type.sys.id)
      .then(create_example_entry)
      .done(done)
  else return W.resolve()
