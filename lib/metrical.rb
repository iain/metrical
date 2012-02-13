require 'metrical/options'

module Metrical

  def self.cli(argv)
    run Options.parse(argv)
  end

  def self.run(options)
    fail "No metrics to run!" if !options[:run] || options[:run].empty?
    options[:run].each do |metric|
      require"metrical/metrics/#{metric}"
      Metrics.const_get(metric.to_s.capitalize).run(options[metric])
    end
  end

end
