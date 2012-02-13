require "metrical/options"

describe Metrical::Options do

  let(:out) { StringIO.new }

  it "prints help with --help" do
    expect { Metrical::Options.parse(["--help"], out) }.to raise_error(SystemExit)
    out.string.should include "Usage: metrical [options]"
  end

  it "prints the version with --version" do
    expect { Metrical::Options.parse(["--version"], out) }.to raise_error(SystemExit)
    out.string.should == "metrical #{Metrical::VERSION}\n"
  end

end
