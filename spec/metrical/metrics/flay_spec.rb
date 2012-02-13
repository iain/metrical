require 'metrical/metrics/flay'

describe Metrical::Metrics::Flay do

  let(:file) { "spec/support/example_for_flay.rb" }
  let(:result) { Metrical::Metrics::Flay.run(:files => file, :options => nil) }

  let(:score) { 518 }

  it "returns a flay total score" do
    result[:total].should == score
  end

  it "returns an overview of the score per file" do
    result[:files][file].should == score.to_f
  end

  it "returns individual masses" do
    result[:report].should == [
      { :type => :identical, :message => "1) IDENTICAL code found in :defn (mass*3 = 486)", :location => [ "#{file}:1", "#{file}:12", "#{file}:23" ] },
      { :type => :similar,   :message => "2) Similar code found in :call (mass = 32)",      :location => [ "#{file}:35", "#{file}:36" ] }
    ]
  end

end
