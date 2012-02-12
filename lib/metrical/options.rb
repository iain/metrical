require 'optparse'

module Metrical
  module Options

    def self.parse(argv)
      options = { :open => true, :saikuro => true }
      opts = OptionParser.new do |opts|

        opts.version = Metrical::VERSION

        opts.on "--[no-]saikuro", "Run Saikuro (default: true)" do |saikuro|
          options[:saikuro] = saikuro
        end

        opts.on "--[no-]open", "Automatically open report in browser (default: true)" do |open|
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
