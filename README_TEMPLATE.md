# RFSWARM-DOCKER
## Why? [![why rfswarm](https://img.shields.io/badge/start%20with-why%3F-brightgreen.svg?style=flat)]

> In quality assurance filed, it's appears like an evidence that performance tests are critical to increase confidance about software resilience, sclability or to identify likely bottleneck for instance.
> Despite those evidence, performances tests are not systematically implemented in software developpement cycle, on the contrary most of the time they aren't even present in test heritage. Why that?
> One of the reason might be that performance tests are a specific test type which require a specific vocabulary, kwoledge and environnement dependecy. In addition, most performance test softwares require time to get into, and to become confortable with the software
> Finally ,performance testing requires graphical representation of the relevant metrics measured during testing, to facilitate result's interpretation. 
> To help democratize performance testing for a wide range of projets in need, "rfswarm-docker" have been created.

## What is RFSWARM
Rfswarm is a performance test tool creates by damies13 [rfswarm](https://github.com/damies13/rfswarm/tree/master/Doc) to make it easy the reuse of integration or functionas tests written with robot framework.
Which help to optimize test effort, minimize test heritage maintenance and improve quality assurance efficiency.

## rfswarm-docker then?
rfswarm-docker have been created to make rfswarm performance test tool available in a containarize version.
Making the tool available in a Docker container, facilitating the automation of performance tests by integrating them into a CI/CD chain.
Applying performance test on Application under test (ATU) has never been easier.
Just run manager agent image, your neeedd agent image which will run the nomber of user desired on your choosen server.
 
[![1.4.0](https://badge.fury.io/js/cropperjs.svg)](https://badge.fury.io/js/cropperjs)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Esthenia-collaboration/rfswarm-docker/issues)
![Docker Pulls][docker-pull-url]

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
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wikista