require 'churn/churn_calculator'

module Metrical
  module Metrics
    class Churn

      def self.run(options = nil)
        options ||= { :minimum_churn_count => 0 }
        output_string = ""
        ::Churn::ChurnCalculator.new(options).report(false)[:churn]
      end

    end
  end
end
