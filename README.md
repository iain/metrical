## Warning: This gem is not being maintained anymore!

I work exclusively with Ruby 1.9, and most tools included don't (fully) support it.
If you want to take over the project, fork the project, and open an issue stating your intentions.

---

# Metrical

[![Build Status](https://secure.travis-ci.org/iain/metrical.png)](http://travis-ci.org/iain/metrical)

MetricFu is awesome! Metrical strives to make it a little bit easier to get working.

## Features

### Cleverer defaults

Normally, RCov would work on a black-listing basis. This means that your coverage reports would
occasionally be flooded with code outside your project. No longer, because the default is now to
exclude everything and only include your `lib` and `app` directories. It also fixes some issues with
loading RSpec.

## Usage

You're advised to install it with Bundler, because of dependency issues. Add this to your `Gemfile`:

    gem 'metrical', :require => false
    
Then run:

    bundle install

And run it:

    bundle exec metrical

## Configuration

You can configure MetricFu in a `.metrics` file in the root of your project.

    MetricFu::Configuration.run do |config|
      config.metrics -= [ :rcov ]
    end

For more information on configuring your metrics, please visit the
[MetricFu homepage](http://metric-fu.rubyforge.org/).

You can also turn off metrics when running, for instance:

    bundle exec metrical --no-rcov

The metrics you can turn on and off depend on the type of project you are in.
For instance, Rails projects also have `rails_best_practices` and `stats` as
options.

Also, Metrical tries to be smart about your Ruby version. Some metrics are not
available on Ruby 1.9 and are disabled automatically.

To see which metrics are available, run:

    bundle exec metrical --help

And that's all there is too it. If you have any suggestions, ideas or bug fixes,
please drop me a line, or make a github issue.

## Known issues

### General lack of support of Ruby 1.9

Most tools don't handle Ruby 1.9 new syntax properly. It doesn't look like this is going to change any time soon.

### RCov and Ruby 1.9

RCov doesn't work at all with Ruby 1.9. You should use something like
[SimpleCov](https://github.com/colszowka/simplecov). Unfortunately, it hasn't been included into
MetricFu yet. Until then, Metrical automatically disables RCov under Ruby 1.9.

### New syntax in Ruby 1.9

Most metrics can't cope with the new syntax in Ruby 1.9. There is nothing I can do about that, or
the creator of these metrics, because the root lie in the code parser they use. Either don't use the
new syntax or exclude these metrics in your `.metrics` file.

### Roodi vs. Psych

If you're running Ruby 1.9 with Psych as your default YAML parser (possible in 1.9.2, and the
default in 1.9.3), you might get an error message. [Read this issue](https://github.com/iain/metrical/issues/15).

### Gem dependency issues

Metrical depends on a lot of other gems. This means that sometimes, when a new version of a gem is released,
Rubygems will load the wrong version of the gem, that might be incompatible.

If you get a message like `can't activate X, already activated Y`, or something similar, use Bundler.


## Development

Install dependencies:

    gem install bundler && bundle install

Run the specs:

    rspec


## Changelog

Version 0.1.0:

* Finally added tests and added metrical to Travis
* Add option `--no-open` to stop it from opening in the browser
* Automatically turn off RCov in Ruby 1.9.x
* Depend on RCov 0.9, so installation will work under Ruby 1.9
* Remove other dependencies, it looks like MetricFu has that covered now.
* Automatically turn off Saikuro on Ruby 1.9.x
* Add switches for every metric (run `metrical --help` to see them all)

---
Copyright 2010-2011, [Iain Hecker](http://iain.nl) - Released under the MIT License.
