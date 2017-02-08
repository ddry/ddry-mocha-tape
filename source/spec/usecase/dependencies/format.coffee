'use strict'

module.exports = (dd, that) ->
  dd.drive
    it: "formats resolved filename"
    i: [ 'wherever/it/can/be/in/whatever/environment/node_modules/ddry/index.js' ]
    e: 'node_modules/ddry/index.js'
