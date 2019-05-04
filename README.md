# ddry-mocha-tape

[![Build Status](https://travis-ci.org/ddry/ddry-mocha-tape.svg?branch=master)](https://travis-ci.org/ddry/ddry-mocha-tape) [![Coverage Status](https://coveralls.io/repos/github/ddry/ddry-mocha-tape/badge.svg?branch=master)](https://coveralls.io/github/ddry/ddry-mocha-tape?branch=master) [![dependencies Status](https://david-dm.org/ddry/ddry-mocha-tape/status.svg)](https://david-dm.org/ddry/ddry-mocha-tape) [![devDependencies Status](https://david-dm.org/ddry/ddry-mocha-tape/dev-status.svg)](https://david-dm.org/ddry/ddry-mocha-tape?type=dev)

<img src="https://cloud.githubusercontent.com/assets/5163953/22628172/6b91f120-ebe0-11e6-8456-0f5b2dc3a553.png" alt="ddry logo" width="250">

Mounts three test harnesses and three test utility modules to **ddry**. It's hardly believable that you'll ever need this setup, it is for testing **ddry** itself mostly.

Includes:

- [ddry](https://www.npmjs.com/package/ddry) v0.1.26
- [Mocha](https://www.npmjs.com/package/mocha) v6.1.4
- [TAP](https://www.npmjs.com/package/tap) v13.1.2
- [Tape](https://www.npmjs.com/package/tape) v4.10.1
- [ddry-tap-spec](https://www.npmjs.com/package/ddry-tap-spec) v0.0.3
- [istanbul](https://www.npmjs.com/package/istanbul) v0.4.5
- [coveralls](https://www.npmjs.com/package/coveralls) v3.0.3
- [mocha-lcov-reporter](https://www.npmjs.com/package/mocha-lcov-reporter) v1.3.0

Anyway, this powerful setup enables this module to be used in **ddry** as only **devDependency**.

Version reflects **ddry** version.

### Few words about ddry

It is made to remove all the error-prone code clutter from testing. No more fiddling with `require` target code modules for testing or assertion libraries. You simply _(convention-over-configuration)_ organize your spec folder similar to your code folder, where module spec folder structure resembles module properties and methods structure, and in `spec/someFolder/someModule/someMethod.js` file you have the context of `someMethod` of `someModule` without any requiring — [ddry](https://www.npmjs.com/package/ddry) does it for you seamlessly and transparently. Then in this way placed file

```coffee
'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'does everything correctly'
    i: [ 'arguments', 'a', 'method', 'receives' ]
    e: 'value it returns'
  ]
```

And that's it. `i` is for input, `e` is for expected. Let's keep focused on data flow. Pray excuse me who think that `require`, `assert`, `expect` etc. are the essence of testing.

This data-driven code will be adapted and passed by [ddry](https://www.npmjs.com/package/ddry) to any of three JS test harnesses: [Mocha JS](https://www.npmjs.com/package/mocha), [TAP](https://www.npmjs.com/package/tap) or [Tape JS](https://www.npmjs.com/package/tape). [ddry](https://www.npmjs.com/package/ddry) itself is fully covered on all of them with unified harness-agnostic codebase.

Also [ddry](https://www.npmjs.com/package/ddry) has:
- cross-harness features: context, before/after hooks and x-style skipping and mass-skipping;
- powerful default matchers set including `plain`, `contains` and `error` and easy custom matchers adding;
- spec sequence syntax allowing to use one setting through multiple specs;
- convention-over-configuration folder-style module instances support;
- easily configurable instantiable attachable spec helper;
- Selenium Webdriver support (with Mocha only);
- `ddry` shell command to maintain the project spec config file `ddry.json`;
- test harness specific commands `ddry-tap` etc. to comfortly run the specs of your choice against test harness of your choice;
- some cute minor features.

Plainly, a decent set of capabilities to make JS testing easy and even fun.

### ddry command line interface

ddry CLI gives you convenient access to your data-driven specs by
- keeping their config in `ddry.json` file;
- implementing powerful features for maintaining this config file;
- applying **only-except** style suite running scope with one shell command. 

_**Only-except** scoping logic is applicable to modules folders, modules and module methods levels._

In your development environment you may want to get easy access to `ddry` shell command by installing [ddry](https://www.npmjs.com/package/ddry) globally:

```sh
$ sudo npm i -g ddry
```

`ddry` shell command is just a spec configuring tool, it does not perform any actual testing which is task of harness-specific commands as well as spec suite execution scoping. This package is one of four test harness specific **ddry** optional dependencies packages solving two main tasks:
- adding viable `devDependencies` set — **ddry** core and all three test harnesses — to `package.json`;
- implementing harness-specific shell commands `ddry-mocha`, `ddry-tap` and `ddry-tape`.

Other three are
- [ddry-mocha](https://www.npmjs.com/package/ddry-mocha) for Mocha JS;
- [ddry-tap](https://www.npmjs.com/package/ddry-tap) for TAP;
- [ddry-tape](https://www.npmjs.com/package/ddry-tape) for Tape JS.

Easy access to `ddry-mocha`, `ddry-tap` and `ddry-tape` commands is obtained by installing this package globally:

```sh
$ sudo npm i -g ddry-mocha-tape
```

### Spec suite configuring tool

Well, we have `devDependencies` installed and set of shell commands. Now you can start your `ddry.json` file with `$ ddry i` (`init`) command. It is very easy and welcoming and has quite comprehensive documentation accessible via `$ ddry ? i` command.

Then you can populate your spec folder with data-driven specs and adjust `ddry.json` file for running specs from within the test harness of your choice. Just pass to it the `./node_modules/ddry/ddry.js` file. Please check [Makefile](https://github.com/ddry/ddry-mocha-tape/blob/master/Makefile) of this project for examples for every supported test harness.

`ddry.json` contains full information on data-driven testing of the project. It may have or may not have advanced configuration options which are subject to [ddry](https://www.npmjs.com/package/ddry) core documentation. Anyway, whatever comfort you may have in addition to editing `ddry.json` manually, `ddry` shell command delivers.

With `config` or `c` command you can plug your own JS module receiving arguments and returning the config object you need. That is how config editing automation is solved here.

With `titles` or `t` command you can parse your code folder for module titles taken from the first block comment. Also this command builds the system file `cli.json` used for spec suite execution scoping. If scoping fails, `ddry t` will fix it likely.

With `addScope` or `as` and `removeScope` or `rs` commands you can set and unset permanent **only-except** scopes that will affect running spec from within test harness.

With `add` or `a` and `remove` or `r` commands you can add and remove values of config object. These two commands are rather for compatibility, scoping commands described above or manual editing of `ddry.json` look much more appropriate.

`usage` or `?` or `h` command outputs usage info — summary or for given command. We don't need to reproduce it here.

### Spec suite execution scoping

`ddry-<mocha|tap|tape>` without parameters will launch the entire suite configured in `ddry.json` against its harness.

Use `-e` and `-o` keys for **except** and **only** scoping strategies applied to `tab`-completed code or spec files or folders. Inside code folder you have access to module folders and module level, inside spec folder you may scope method-wise. Keys you use with `ddry-tap` command will have effect only once, while this shell command runs.

As mentioned above, to manage permanent scopes in `ddry.json` you may use `$ ddry as` and `$ ddry rs` commands — they will translate to config object style (dot-notated, by the way) your `tab`-completed findings.

### Programmatical usage
**(obsolete)**

Feed to the test harness any JS file of your choice and start **ddry** modular usage from

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

But I think you really want CLI for actual work. Editing the spec config in and out for use-once scopes is as boring to death probably as `grep`-ping around your tests.
