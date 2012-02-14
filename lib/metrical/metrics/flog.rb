require 'flog'

module Metrical
  module Metrics
    class Flog

      def self.run(options)
        flog = ::Flog.new
        flog.flog(*Array(options[:files]))
        report = []
        flog.each_by_score do |method, score, list|
          report << { :method => method, :score => score, :list => list }
        end
        { :total => flog.total, :report => report }
      end

    end
  end
end
