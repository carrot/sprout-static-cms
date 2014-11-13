# <%= S(name).humanize().s %>

<%= description %>

Setup
-----

- make sure [node.js](http://nodejs.org) and [roots](http://roots.cx) are installed
- clone this repo down and `cd` into the folder
- run `npm install`
- run `roots watch`
- ???
- get money


Deployment
----------

This site is hosted at Bitballoon.

Run `make deploy` to deploy the site. This command is a shortcut for compiling the site with roots and deploying using [ship](https://github.com/carrot/ship). See the [Makefile](Makefile) for more info.
