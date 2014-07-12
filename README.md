sandbox-runner [![NPM version][npm-image]][npm-url] [![Build Status][ci-image]][ci-url] [![Dependency Status][depstat-image]][depstat-url]
================

> Eval a piece of javascript text in a sandbox environment
> Could be useful to test code generation or test javascript without proper module encapsulation.

## Install

Install using [npm][npm-url].

    $ npm install sandbox-runner

## Usage

```javascript

var fs = require('fs');
var sandbox = require('sandbox-runner');

var codeSnippet = fs.readFileSync('./templates.js', {encoding:'utf8'});

/* Content of templates.js
this.Templates = this.Templates != null ? this.Templates : {};
this.Templates["hello"] = function (name) {
            return 'hello ' + name + '!';
          };
this.Templates["foo"] = function () {
            return 'foo';
          };
*/

var context = sandbox.run(codeSnippet);

context.Templates.hello('world').should.equal('hello world !');

```

## API

### `sanbox.run(script, context = {})`

> run the script snippet, a `context` is provided as `this` pointer.

* **script** The script text to be executed
* **context** The context that used in execution. An empty object will be provide if omitted.

** HINT ** Exception is thrown when error occurs in script. Remember to catch the exception in async code.

### `sandbox.moduleRun(script, filename = '')`

> run the script snippet as a node.js module

* **script** The script text to be executed
* **filenae** The fake file name that of the module in file system.

## License
MIT

[![NPM downloads][npm-downloads]][npm-url]

[npm-url]: https://npmjs.org/package/sandbox-runner
[npm-image]: http://img.shields.io/npm/v/sandbox-runner.svg?style=flat
[npm-downloads]: http://img.shields.io/npm/dm/sandbox-runner.svg?style=flat

[ci-url]: https://drone.io/github.com/timnew/sandbox-runner/latest
[ci-image]: https://drone.io/github.com/timnew/sandbox-runner/status.png

[depstat-url]: https://gemnasium.com/timnew/sandbox-runner
[depstat-image]: http://img.shields.io/gemnasium/timnew/sandbox-runner.svg?style=flat
