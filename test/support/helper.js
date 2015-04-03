var chai   = require('chai'),
    path   = require('path'),
    Sprout = require('sprout');

var sprout = new Sprout(path.join(__dirname, '../config'));

global.chai   = chai;
global.sprout = sprout;
global.expect = chai.expect;
global._path  = path.join(__dirname, '../fixtures');
