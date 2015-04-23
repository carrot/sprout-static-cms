module.exports = 
  access_token: '<%= delivery_token %>'
  management_token: '<%= management_token %>'
  space_id: '<%= space_id %>'
  content_types: {}                   # remove these object braces once the config below is filled out
    # posts:                          # data will be made available through this key on the `contentful` object in your templates
    #   id: 'xxxx'                    # ID of your content type
    #   filters: {}                   # passes filters to the call to contentful's API, see contentful's docs for more info
    #   template: 'path/to/template'  # if present a single page view will be created for each entry in the content type
    #   path: (entry) ->              # override function for generating single page file path, passed in the entry object
