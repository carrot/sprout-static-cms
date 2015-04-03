var chai   = require('chai'),
    path   = require('path'),
    Sprout = require('sprout');

var should = chai.should();
var sprout = new Sprout(path.join(__dirname, '../config'));

global.chai   = chai;
global.sprout = sprout;
global.should = should;
global._path  = path.join(__dirname, '../fixtures');
