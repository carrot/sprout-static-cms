exports.configure = [
  {
    name: 'name',
    message: 'What is the name of your project?'
  },
  {
    name: 'description',
    message: 'Describe your project'
  },
  {
    name: 'delivery_token',
    message: 'What is your Contentful Delivery API token?'
  },
  {
    name: 'management_token',
    message: 'What is your Contentful Managment API token?'
  },
  {
    name: 'space_id',
    message: 'What is your Contentful Space ID?'
  },
  {
    name: 'netlify_token',
    message: 'What is your Netlify access token?'
  }
]

exports.after = ->
  console.log 'Awesome! Your static CMS roots project has been set up and configured. \nTry it out by creating a content type on Contentful, configuring the content type in `app.coffee`, \nand then accessing it in your templates using the `contentful` local variable. To learn more, check out the roots-contentful readme: https://github.com/carrot/roots-contentful'
