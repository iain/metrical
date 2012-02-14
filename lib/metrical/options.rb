require "metrical/version"
require "optparse"

module Metrical
  class Options

    def self.parse(*args)
      new(*args).parse!
    end

    def initialize(argv, config, out = STDOUT)
      @argv, @config, @out = argv, config, out
    end

    def parse!
      parser.parse!(@argv)
    rescue OptionParser::InvalidOption => error
      puts error.message
      puts parser
      exit 1
    end

    def parser
      @parser ||= OptionParser.new do |opts|

        opts.banner = "Usage: metrical [options]"

        opts.on "--[no-]flog", "Enable or disable flog" do |option|
          if option
            @config.enable_metric :flog
          else
            @config.disable_metric :flog
          end
        end

        opts.on "--paths lib,app", Array, "The paths to run the metrics over (defaults to app and lib)" do |paths|
          @config.paths = paths
        end

        opts.on_tail "-h", "--help", "Displays this help" do
          puts opts
          exit
        end

        opts.on_tail "-v", "--version", "Display version" do
          puts "metrical #{VERSION}"
          exit
        end

      end
    end

    def puts(*args)
      @out.puts(*args)
    end

  end
end
