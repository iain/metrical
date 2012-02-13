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

end
