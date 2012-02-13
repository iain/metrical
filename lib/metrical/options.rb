require "metrical/version"
require "optparse"

module Metrical
  class Options

    def self.parse(argv, out = STDOUT)
      new(argv, out).parse!
    end

    def initialize(argv, out)
      @argv, @out = argv, out
    end

    def parse!
      parser.parse!(@argv)
      {}
    rescue OptionParser::InvalidOption => error
      puts error.message
      puts parser
      exit 1
    end

    def parser
      @parser ||= OptionParser.new do |opts|

        opts.banner = "Usage: metrical [options]"

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
