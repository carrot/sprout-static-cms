axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
contentful   = require 'roots-contentful'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  extensions: [
    contentful
      access_token: '<%= access_token %>'
      management_token: '<%= management_token %>'
      space_id: '<%= space_id %>'
      content_types: [
        # {
        #   id: 'xxxx'                    # ID of your content type
        #   name: 'posts'                 # data will be made available through this key on the `contentful` object in your templates
        #   filters: {}                   # passes filters to the call to contentful's API, see contentful's docs for more info
        #   template: 'path/to/template'  # if present a single page view will be created for each entry in the content type
        #   path: (entry) ->              # override function for generating single page file path, passed in the entry object
        # }
      ]
  ]
