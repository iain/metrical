require 'churn/churn_calculator'

module Metrical
  module Metrics
    class Churn

      class Calculator < ::Churn::ChurnCalculator

        # Silenced output
        def self.git?
          system "git branch > /dev/null 2>&1"
        end
      end

      def self.run(options = nil)
        options ||= { :minimum_churn_count => 0 }
        output_string = ""
        Calculator.new(options).report(false)[:churn]
      end

    end
  end
end
