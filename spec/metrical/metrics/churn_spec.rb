require 'metrical/metrics/churn'

describe Metrical::Metrics::Churn do

  let(:result) { Metrical::Metrics::Churn.run }

  it "reports changes" do
    change = result[:changes].find { |change| change[:file_path] == "lib/metrical.rb" }
    change[:times_changed].should be >= 5
  end

end
