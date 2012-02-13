require 'metrical'

describe Metrical do

  describe ".cli" do

    it "parses command line options" do
      argv = stub "argv"
      Metrical.stub(:run)
      Metrical::Options.should_receive(:parse).with(argv)
      Metrical.cli(argv)
    end

    it "runs the metrics with the options options from the command line" do
      options = stub "options"
      Metrical::Options.stub(:parse).and_return(options)
      Metrical.should_receive(:run).with(options)
      Metrical.cli([])
    end

  end

  describe ".run" do

    it "needs metrics" do
      expect { Metrical.run({}) }.to raise_error "No metrics to run!"
      expect { Metrical.run(:run => []) }.to raise_error "No metrics to run!"
    end

    it "can execute flay" do
      flay_options = stub "flay_options"
      Metrical::Metrics::Flay.should_receive(:run).with(flay_options)
      Metrical.run :run => [ :flay ], :flay => flay_options
    end

    it "won't run flay when not specified" do
      Metrical::Metrics::Flay.should_not_receive(:run)
      Metrical.run :run => [ :flog ]
    end

  end

end
