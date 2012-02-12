require 'optparse'

module Metrical
  module Options

    def self.parse(argv)
      options = { :open => true }
      opts = OptionParser.new do |opts|

        opts.version = Metrical::VERSION

        opts.on "--[no-]open", "Automatically open report in browser" do |open|
          options[:open] = open
        end

      end

      opts.parse!(argv)
      options
    end

  end
end
