path = require 'path'
rimraf = require 'rimraf'
fs = require 'fs'
nodefn = require 'when/node'

test_template_path = path.resolve(_path, '../..')
test_path          = path.join(__dirname, 'tmp')

tpl = 'sprout-static-cms'

opts =
  locals: locals
  verbose: true

before (done) ->
  sprout.add(tpl, test_template_path, {verbose: true})
    .then -> rimraf.sync(test_path)
    .then -> sprout.init(tpl, test_path, opts)
    .done(-> done())

after ->
  sprout.remove(tpl).then -> rimraf.sync(test_path)

describe 'sprout-static-cms', ->

  it 'should load the correct values into contentful.coffee', (done) ->
    nodefn.call(fs.readFile, path.join(test_path, 'contentful.coffee'), 'utf8')
      .then (res) ->
        expect(res).to.have.string "access_token: '#{locals.delivery_token}'"
        expect(res).to.have.string "management_token: '#{locals.management_token}'"
        expect(res).to.have.string "space_id: '#{locals.space_id}'"
      .then(-> done()).catch(done)

  it 'should load the correct values into package.json', ->
    pkg = require(path.join(test_path, 'package.json'))
    expect(pkg.name).to.equal(locals.name)
    expect(pkg.description).to.equal(locals.description)

  it 'should load the correct values in the ship file', (done) ->
    nodefn.call(fs.readFile, path.join(test_path, 'ship.conf'), 'utf8')
      .then (res) ->
        expect(res).to.have.string "name: '#{locals.name}'"
        expect(res).to.have.string "access_token: '#{locals.netlify_token}'"
      .then(-> done()).catch(done)
