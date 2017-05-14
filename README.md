# ddry-mocha-tape

[![Build Status](https://travis-ci.org/ddry/ddry-mocha-tape.svg?branch=master)](https://travis-ci.org/ddry/ddry-mocha-tape) [![Coverage Status](https://coveralls.io/repos/github/ddry/ddry-mocha-tape/badge.svg?branch=master)](https://coveralls.io/github/ddry/ddry-mocha-tape?branch=master) [![dependencies Status](https://david-dm.org/ddry/ddry-mocha-tape/status.svg)](https://david-dm.org/ddry/ddry-mocha-tape) [![devDependencies Status](https://david-dm.org/ddry/ddry-mocha-tape/dev-status.svg)](https://david-dm.org/ddry/ddry-mocha-tape?type=dev)

<img src="https://cloud.githubusercontent.com/assets/5163953/22628172/6b91f120-ebe0-11e6-8456-0f5b2dc3a553.png" alt="ddry logo" width="250">

Mounts three test harnesses and three test utility modules to **ddry**. It's hardly believable that you'll ever need this setup, it is for testing **ddry** itself mostly.

Includes:

- [ddry](https://www.npmjs.com/package/ddry) v0.1.18
- [Mocha](https://www.npmjs.com/package/mocha) v3.3.0
- [TAP](https://www.npmjs.com/package/tap) v10.3.2
- [Tape](https://www.npmjs.com/package/tape) v4.6.3
- [ddry-tap-spec](https://www.npmjs.com/package/ddry-tap-spec) v0.0.2
- [istanbul](https://www.npmjs.com/package/istanbul) v0.4.5
- [coveralls](https://www.npmjs.com/package/coveralls) v2.13.1
- [mocha-lcov-reporter](https://www.npmjs.com/package/mocha-lcov-reporter) v1.3.0

Anyway, this powerful setup enables this module to be used in **ddry** as only **devDependency**.

Version reflects **ddry** version.

### ddry CLI usage

ddry CLI gives you convenient access to your data-driven specs by
- keeping their config in `ddry.json` file
- implementing powerful features for maintaining this config file
- applying **only-except** style suite running scope with one shell command. 

_**Only-except** scoping logic is applicable to modules folders, modules and module methods levels._

To run the spec configured with `ddry.json` from within the test harness feed it the `./node_modules/ddry/ddry.js` file. Please check [Makefile](https://github.com/ddry/ddry-mocha-tape/blob/master/Makefile) of this project for examples for every supported harness.

In your development environment you may want to get easy access to `ddry` shell command by installing [ddry](https://www.npmjs.com/package/ddry) globally:

```sh
$ sudo npm i -g ddry
```

`ddry` is just a spec configuring tool, it does not perform any actual testing which is task of harness-specific commands as well as spec suite execution scoping.

Easy access to **all three** harness-specific **ddry** commands is also obtained by installing this package globally:

```sh
$ sudo npm i -g ddry-mocha-tape
```

And that's it, now you have `ddry-mocha`, `ddry-tap` and `ddry-tape` shell commands. Run them without parameters for entire suite or use `-e` and `-o` keys for **except** and **only** scoping strategies applied to `tab`-completed code or spec files or folders.

### Programmatical usage
**(obsolete)**

Feed to your test harness any JS file of your choice and start **ddry** modular usage from

```coffee
spec = require('ddry/modular')()
spec.apply
  title: 'Your awesome module'
  code: 'lib'
  spec: 'spec'
```

or even ultimately superlatively obsolete basic plain usage:
```coffee
DataDriven = require 'ddry'
```

But I think you really want CLI for actual work.
