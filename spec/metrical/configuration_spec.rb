require 'metrical/configuration'

describe Metrical::Configuration do

  it "defaults to all files in lib and app" do
    subject.files.should include "lib/metrical.rb"
  end

  it "has default metrics" do
    subject.metrics.should == [ :flog, :flay, :reek, :churn ]
  end

  it "can turn off metrics" do
    subject.metrics -= [ :flog ]
    subject.metrics.should_not include :flog
  end

  it "can change the paths to find other files" do
    subject.paths += [ "spec/" ]
    subject.files.should include "spec/metrical/configuration_spec.rb"
  end

end
