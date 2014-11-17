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
      access_token: '<%= contentful_token %>'
      space_id: '<%= space_id %>'
      <% if (set_up_contentful) { %>
        content_types: [
          {
            id: '<%= content_type_id %>'
            name: 'blog_posts'
            filters: {}
          }
        ]
      <% } %>
  ]
