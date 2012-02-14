require 'metrical/configuration'

describe Metrical::Configuration do

  it "defaults to all files in lib and app" do
    subject.files.should include "lib/metrical.rb"
  end

  describe "#metrics" do

    it "has default metrics" do
      subject.metrics.should == [ :flog, :flay, :reek, :churn ]
    end

    it "can set metrics" do
      metrics = stub
      subject.metrics = metrics
      subject.metrics.should == metrics
    end

  end

  describe "#paths" do

    it "can change the paths to find other files" do
      subject.paths += [ "spec/" ]
      subject.files.should include "spec/metrical/configuration_spec.rb"
    end

  end

  describe "#enable_metric" do

    it "can enable metrics" do
      metric = stub :some_metric
      expect { subject.enable_metric metric }.to change { subject.metrics }
      subject.metrics.should include metric
    end

    it "won't enable metrics twice" do
      expect { subject.enable_metric :flog }.not_to change { subject.metrics }
    end

  end

  describe "#disable_metric" do

    it "disables metrics" do
      expect { subject.disable_metric :flog }.to change { subject.metrics }
      subject.metrics.should_not include :flog
    end

    it "allows disabled metrics to be disabled" do
      metric = stub :some_metric
      subject.disable_metric metric
      subject.metrics.should_not include metric
    end
  
  end

end
