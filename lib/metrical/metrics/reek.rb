require "reek"

module Metrical
  module Metrics
    class Reek

      def self.run(options = nil)
        warnings = ::Reek::Examiner.new(Array(options[:files])).all_active_smells
        warnings.map { |warning|
          { :location => warning.location, :smell => warning.smell }
        }
      end

    end
  end
end
