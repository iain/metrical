require 'spec_helper'

describe Metrical, "running" do

  before do
    FileUtils.rm_f("tmp/metric_fu")
  end

  it "loads the .metrics file" do
    out, err = metrical
    out.should include "Metrics config loaded"
  end

  it "creates a report yaml file" do
    expect { metrical }.to create_file("tmp/metric_fu/report.yml")
  end

  it "creates a report html file" do
    expect { metrical }.to create_file("tmp/metric_fu/output/index.html")
  end

  it "displays help" do
    out, err = metrical("bundle exec metrical --help")
    out.should include "Usage: metrical [options]"
  end

  it "displays version" do
    out, err = metrical("bundle exec metrical --version")
    out.should == "metrical #{Metrical::VERSION}"
  end

  def metrical(command = "--no-open")
    $cache ||= {}
    if $cache[command]
      $cache[command]
    else
      stdin, stdout, stderr = Open3.popen3("metrical #{command}")
      $cache[command] = [ stdout.read.strip, stderr.read.strip ]
    end
  end

end
