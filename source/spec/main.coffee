'use strict'

spec = require('ddry/modular')()

spec.apply
  title: 'ddry, Mocha and Tape dependencies presence'
  spec: 'spec/usecase'
  moduleTitles:
    dependencies: 'ddry-mocha-tape dependencies'
  outside:
    dependencies: 'usecase/dependencies'
