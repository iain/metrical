require "metrical/options"

describe Metrical::Options do

  describe ".parse" do

    let(:out) { StringIO.new }

    it "prints help with --help" do
      expect { Metrical::Options.parse(["--help"], out) }.to raise_error(SystemExit)
      out.string.should include "Usage: metrical [options]"
    end

    it "prints the version with --version" do
      expect { Metrical::Options.parse(["--version"], out) }.to raise_error(SystemExit)
      out.string.should == "metrical #{Metrical::VERSION}\n"
    end

    it "halts and shows help when unknown option is set" do
      expect { Metrical::Options.parse(["--non-existing"], out) }.to raise_error(SystemExit)
      out.string.should include "invalid option: --non-existing"
      out.string.should include "Usage: metrical [options]"
    end

    it "returns the options set" do
      Metrical::Options.parse([], out).should be_a Hash
    end

  end

end
