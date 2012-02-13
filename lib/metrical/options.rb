require 'optparse'

module Metrical
  module Options

    def self.defaults

      defaults = {
        :open => true,
        :metrics => Hash.new(true)
      }
      defaults[:metrics][:saikuro] = version(ruby) < version("1.9")
      defaults[:metrics][:rcov]    = version(ruby) < version("1.9")
      defaults
    end

    def self.version(version)
      Gem::Version.new(version)
    end

    def self.ruby
      RUBY_VERSION.dup
    end

    def self.metrics
      MetricFu.configuration.metrics.sort_by(&:to_s)
    end

    def self.parse(argv)
      options = defaults.dup

      opts = OptionParser.new do |opts|

        opts.version = Metrical::VERSION

        metrics.each do |metric|

          opts.on "--[no-]#{metric}", "Enables or disables #{metric.to_s.titleize} (default: #{options[:metrics][metric]})" do |option|
            options[:metrics][metric] = option
          end

        end

        opts.on "--[no-]open", "Open report in browser" do |open|
          options[:open] = open
        end

      end

      begin
        opts.parse!(argv)
      rescue OptionParser::InvalidOption => error
        puts error.message
        puts opts
        exit 1
      end
      options
    end

  end
end
