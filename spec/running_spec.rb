require 'spec_helper'

describe Metrical, "running" do

  before do
    FileUtils.rm_rf("tmp/metric_fu")
  end

  it "has a clean start" do
    File.should_not exist("tmp/metric_fu")
  end

  it "loads the .metrics file" do
    out = metrical
    out.should include "Metrics config loaded"
  end

  it "creates a report yaml file" do
    expect { metrical }.to create_file("tmp/metric_fu/report.yml")
  end

  it "creates a report html file" do
    expect { metrical }.to create_file("tmp/metric_fu/output/index.html")
  end

  it "displays help" do
    out = metrical("bundle exec metrical --help")
    out.should include "Usage: metrical [options]"
  end

  it "displays version" do
    out = metrical("bundle exec metrical --version")
    out.should == "metrical #{Metrical::VERSION}"
  end

  it "errors on unknown flags" do
    expect { metrical "--asdasdasda" }.to raise_error
  end

  def metrical(command = "--no-open")
    results = `metrical #{command} 2>&1`
    $?.to_i.should eq(0), "The command 'metrical #{command}' failed!\n\n#{results}"
    results.strip
  end

end
