require 'metrical/options'
require 'metrical/metrics/flay'

module Metrical

  def self.cli(argv)
    run Options.parse(argv)
  end

  def self.run(options)
    fail "No metrics to run!" if !options[:run] || options[:run].empty?
    Metrics::Flay.run(options[:flay]) if options[:run].include?(:flay)
  end

end
