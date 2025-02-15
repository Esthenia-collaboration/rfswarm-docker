# rfswarm-docker
> Short blurb about what your product does.

[![NPM Version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]
![Docker Pulls][docker-pull-url]


One to two paragraph statement about your product and what it does.

![](header.png)

## Installation

OS X & Linux:

```sh
npm install my-crazy-module --save
```

Windows:

```sh
edit autoexec.bat
```

## Agent Images available

| Image Name | Status | Description |
| ---- | ---- | ---- |
| estheniacollaboration/rfswarm-agent-base | Available | Debian base with Python 3.x, Rfswarm Agent, robot framework, RequestsLibrary, DataDriver Library |
| estheniacollaboration/rfswarm-agent-sshlibrary | Available | Base + sshlibrary |
| estheniacollaboration/rfswarm-agent-seleniumlibrary-chrome | Available | Base + seleniumlibrary + Chrome |
| estheniacollaboration/rfswarm-agent-seleniumlibrary-firefox | Planned | Base + seleniumlibrary + FireFox |


## Manager Images
| Image Name | Status | Description |
| ---- | ---- | ---- |
| estheniacollaboration/rfswarm-manager-base | Planned | Debian base with Python 3.x, Rfswarm Manager |

## Usage example

A few motivating and useful examples of how your product can be used. Spice this up with code blocks and potentially more screenshots.

_For more examples and usage, please refer to the [Wiki][wiki]._

## Development setup

Describe how to install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

```sh
make install
npm test
```

## Release History

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * CHANGE: Remove `setDefaultXYZ()`
    * ADD: Add `init()`
* 0.1.1
    * FIX: Crash when calling `baz()` (Thanks @GenerousContributorName!)
* 0.1.0
    * The first proper release
    * CHANGE: Rename `foo()` to `bar()`
* 0.0.1
    * Work in progress

## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

## Contributing

1. Fork it (<https://github.com/yourname/yourproject/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[docker-pull-url]: https://img.shields.io/docker/pulls/:esthenia-collaboration/:rfswarm-docker
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki