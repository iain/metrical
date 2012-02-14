module Metrical
  class Configuration

    attr_accessor :metrics

    attr_accessor :paths

    def initialize
      defaults!
    end

    def defaults!
      self.metrics = [ :flog, :flay, :reek, :churn ]
      self.paths   = [ "app", "lib" ]
    end

    def files
      paths.map { |path| Dir[File.join(path, "**/*.rb")] }.flatten
    end

    def enable_metric(metric)
      metrics << metric unless metrics.include? metric
    end

    def disable_metric(metric)
      metrics.delete metric
    end

  end
end
