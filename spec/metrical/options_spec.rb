require "metrical/options"

describe Metrical::Options do

  let(:out) { StringIO.new }
  let(:config) { stub "configuration" }

  %w(-h --help).each do |opt|
    it "prints help with #{opt}" do
      expect { parse opt }.to raise_error(SystemExit)
      out.string.should include "Usage: metrical [options]"
    end
  end

  %w(-v --version).each do |opt|
    it "prints the version with #{opt}" do
      expect { parse opt }.to raise_error(SystemExit)
      out.string.should == "metrical #{Metrical::VERSION}\n"
    end
  end

  it "halts and shows help when unknown option is set" do
    expect { parse "--non-existing" }.to raise_error(SystemExit)
    out.string.should include "invalid option: --non-existing"
    out.string.should include "Usage: metrical [options]"
  end

  it "can disable metrics" do
    config.should_receive(:disable_metric).with(:flog)
    parse "--no-flog"
  end

  it "can enable metrics" do
    config.should_receive(:enable_metric).with(:flog)
    parse "--flog"
  end

  it "can set paths" do
    config.should_receive(:paths=).with(["a","b"])
    parse "--paths", "a,b"
  end

  def parse(*argv)
    Metrical::Options.parse(argv, config, out)
  end

end
