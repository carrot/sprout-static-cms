axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
contentful   = require 'roots-contentful'
config       = require './contentful'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'contentful.coffee']

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  extensions: [contentful(config)]
