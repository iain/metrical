require 'metrical/metrics/flog'

describe Metrical::Metrics::Flog do

  let(:file)   { "spec/support/example_for_flog.rb" }
  let(:result) { Metrical::Metrics::Flog.run(:files => file) }

  it "returns a report" do
    result[:report].should == [ {
      :method => "Test#blah",
      :score => 8.272582728507464,
      :list => {
        :assignment => 1.1,
        :eval => 5.5,
        :branch => 1.1,
        :lit_fixnum => 0.325,
        :== => 1.1,
        :puts => 1.2000000000000002
      }
    }]
  end

  it "returns a total" do
    result[:total].should be_within(0.01).of(8.272582728507464)
  end

end
