'use strict'

module.exports =
  format: (path) ->
    path.split('/').slice(-3).join '/'

  coveralls: ->
    @.format require.resolve('coveralls')

  ddry: ->
    @.format require.resolve('ddry')

  ddry_tap_spec: ->
    @.format require.resolve('ddry-tap-spec')

  mocha: ->
    @.format require.resolve('mocha')

  mocha_lcov_reporter: ->
    @.format require.resolve('mocha-lcov-reporter')

  tap: ->
    @.format require.resolve('tap')

  tape: ->
    @.format require.resolve('tape')
