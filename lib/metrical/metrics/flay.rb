require 'flay'

module Metrical
  module Metrics
    class Flay

      def self.run(options)
        new(options).run
      end

      def initialize(options)
        @options = options
      end

      def run
        flay.process(*files)
        {
          :total => flay.total,
          :files => flay.summary,
          :report => report
        }
      end

      def flay
        @flay ||= ::Flay.new(@options[:options])
      end

      def files
        Array @options[:files]
      end

      def report
        def flay.puts(*args)
          @report ||= []
          @report += args
        end
        flay.report
        report = []
        flay.puts.each do |line|
          case line
          when /\A\d+\) IDENTICAL/
            report << { :type => :identical, :location => [], :message => line.strip }
          when /\A\d+\) Similar/
            report << { :type => :similar,   :location => [], :message => line.strip }
          when /\S/
            report.last[:location] << line.strip if report.last
          end
        end
        report
      end

    end
  end
end
