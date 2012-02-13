require 'metrical/metrics/churn'

describe Metrical::Metrics::Churn do

  let(:result) { Metrical::Metrics::Churn.run }

  it "reports changes" do
    result[:changes].size.should == `git ls-files | wc -l`.to_i
  end

end
