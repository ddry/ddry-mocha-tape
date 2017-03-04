# ddry-mocha-tape

[![Build Status](https://travis-ci.org/ddry/ddry-mocha-tape.svg?branch=master)](https://travis-ci.org/ddry/ddry-mocha-tape) [![Coverage Status](https://coveralls.io/repos/github/ddry/ddry-mocha-tape/badge.svg?branch=master)](https://coveralls.io/github/ddry/ddry-mocha-tape?branch=master) [![dependencies Status](https://david-dm.org/ddry/ddry-mocha-tape/status.svg)](https://david-dm.org/ddry/ddry-mocha-tape) [![devDependencies Status](https://david-dm.org/ddry/ddry-mocha-tape/dev-status.svg)](https://david-dm.org/ddry/ddry-mocha-tape?type=dev)

<img src="https://cloud.githubusercontent.com/assets/5163953/22628172/6b91f120-ebe0-11e6-8456-0f5b2dc3a553.png" alt="ddry logo" width="250">

Mounts three test harnesses and three test utility modules to **ddry**. It's hardly believable that you'll ever need this setup, it is for testing **ddry** itself mostly.

Includes:

- [ddry](https://www.npmjs.com/package/ddry) v0.1.7
- [Mocha](https://www.npmjs.com/package/mocha) v3.2.0
- [TAP](https://www.npmjs.com/package/tap) v10.3.0
- [Tape](https://www.npmjs.com/package/tape) v4.6.3
- [ddry-tap-spec](https://www.npmjs.com/package/ddry-tap-spec) v0.0.2
- [istanbul](https://www.npmjs.com/package/istanbul) v0.4.5
- [coveralls](https://www.npmjs.com/package/coveralls) v2.11.16
- [mocha-lcov-reporter](https://www.npmjs.com/package/mocha-lcov-reporter) v1.3.0

Anyway, this powerful setup enables this module to be used in **ddry** as only **devDependency**.

Version reflects **ddry** version, and **ddry** core remains accessible via

```coffee
DataDriven = require 'ddry'
```

Modular usage starts from

```coffee
spec = require('ddry/modular')()
spec.apply
  title: 'Your awesome module'
  code: 'lib'
  spec: 'spec'
```
