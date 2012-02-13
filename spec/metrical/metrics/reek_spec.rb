require "metrical/metrics/reek"

describe Metrical::Metrics::Reek do

  let(:file) { "spec/support/example_for_reek.rb" }

  it "runs" do
    Metrical::Metrics::Reek.run(:files => file).should == [ {
      :location => { "context" => "Dirty#awful", "lines" => [3], "source" => file },
      :smell => { "class" => "LongParameterList", "subclass" => "LongParameterList", "message" => "has 4 parameters", "parameter_count" => 4 }
    }]
  end

end
