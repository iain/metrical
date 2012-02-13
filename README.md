# Metrical

Aiming to replace MetricFu with this version of Metrical.

Design goals:

* Run independently of your application - no need to put Metrical in your Gemfile
* Smart defaults - it works out of the box, without any manual configuration

## Installation

    gem install metrical

## Usage

To start, just run:

    metrical

More info by running:

    metrical --help


## Todo

### Done:

* Flay
* Flog
* Reek
* Churn

### Metrics:

* Roodi
* Coverage (for Ruby 1.9)
* RCov (for Ruby 1.8 only)
* Saikuro (for Ruby 1.8 only)
* Rails Best Practices
* Rake stats
* General stats, like cloc

I am considering dropping support for tools that don't run on Ruby 1.9.

### Other:

* A nice output format
* Per-project configuration file
* Use bundler inside the gem to prevent gem activation issues




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

To run the tests locally:

    gem install bundler && bundle install

    rake
