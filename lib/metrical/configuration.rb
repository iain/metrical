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

  end
end
