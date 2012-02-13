# Metrical

[![Build Status](https://secure.travis-ci.org/iain/metrical.png)](http://travis-ci.org/iain/metrical)

MetricFu is awesome! Metrical strives to make it a little bit easier to get working.

## Features

### Metrical doesn't intrude on your project

Metrical makes it easy to run MetricFu without making it a project dependency. Bundler requires
that everything you need go inside the Gemfile. MetricFu is rather big project with a ton of
dependencies. Including that inside your Gemfile just clutters it up.

Also, MetricFu wants to be installed inside your Rakefile. With Metrical, you can configure MetricFu
in a separate file, `.metrics` in the root of your project.

### Cleverer defaults

Normally, RCov would work on a black-listing basis. This means that your coverage reports would
occasionally be flooded with code outside your project. No longer, because the default is now to
exclude everything and only include your `lib` and `app` directories. It also fixes some issues with
loading RSpec.

## Usage

Install:

    gem install metrical

Run:

    metrical

To get help:

    metrical --help

## Configuration

You can configure MetricFu in a `.metrics` file in the root of your project.

    MetricFu::Configuration.run do |config|
      config.metrics -= [ :rcov ]
    end

For more information on configuring your metrics, please visit the
[MetricFu homepage](http://metric-fu.rubyforge.org/).

And that's all there is too it. If you have any suggestions, ideas or bug fixes,
please drop me a line, or make a github issue.

## Known issues

### RCov and Ruby 1.9

RCov doesn't work with Ruby 1.9. You should use something like
[SimpleCov](https://github.com/colszowka/simplecov). Unfortunately, it hasn't been included into
MetricFu yet. Until then, Metrical automatically disables RCov under Ruby 1.9.

### New syntax in Ruby 1.9

Most metrics can't cope with the new syntax in Ruby 1.9. There is nothing I can do about that, or
the creator of these metrics, because the root lie in the code parser they use. Either don't use the
new syntax or exclude these metrics in your `.metrics` file.

### Roodi vs. Psych

If you're running Ruby 1.9 with Psych as your default YAML parser (possible in 1.9.2, and the
default in 1.9.3), you might get an error message. I have no clue what to do about it. Some help on
this would be greatly appreciated.

### Gem dependency issues

Metrical depends on a lot of other gems. Not all gem authors adhere to guidelines such as
[SemVer](http://semver.org/). This means that sometimes, when a new version of a gem is released,
things break. I try to fix the issues I come across inside Metrical, by making a dependency of a
dependency a fixed dependency of Metrical. It's difficult to do this right.

If you get a message like `can't activate X, already activated Y`, or something similar, you can
open an issue. Please include the entire error message and the output of `gem list` and the version
of Ruby you are using.


## Development

Install dependencies:

    gem install bundler && bundle install

Run the specs:

    rspec


## Changelog

Version 0.1.0 (unreleased):

* Finally added tests and added metrical to Travis
* Add option `--no-open` to stop it from opening in the browser
* Automatically turn off RCov in Ruby 1.9.x
* Depend on RCov 0.9, so installation will work under Ruby 1.9
* Remove other dependencies, it looks like MetricFu has that covered now.
* Automatically turn off Saikuro on Ruby 1.9.x
* Add switches for every metric (run `metrical --help` to see them all)

---
Copyright 2010-2011, [Iain Hecker](http://iain.nl) - Released under the MIT License.
