require 'spec_helper'

describe Metrical, "configuration" do

  it "won't use rcov under ruby 1.9" do
    Metrical.load_settings("1.9.3")
    MetricFu.configuration.metrics.should_not include(:rcov)
    MetricFu.configuration.graphs.should_not include(:rcov)
  end

  it "will use rcov under ruby 1.8" do
    Metrical.load_settings("1.8.7")
    MetricFu.configuration.metrics.should include(:rcov)
    MetricFu.configuration.graphs.should include(:rcov)
  end

  after do
    MetricFu.configuration.reset
  end

end
