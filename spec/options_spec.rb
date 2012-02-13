require 'spec_helper'

describe Metrical::Options do

  describe ".defaults" do

    let(:defaults) { Metrical::Options.defaults }

    context "on every Ruby version" do

      it "opens the report in a browser" do
        defaults[:open].should be_true
      end

      it "enables Flog" do
        defaults[:metrics][:flog].should be_true
      end

      it "enables Flay" do
        defaults[:metrics][:flay].should be_true
      end

      it "enables Reek" do
        defaults[:metrics][:reek].should be_true
      end

      it "enables Hotspots" do
        defaults[:metrics][:hotspots].should be_true
      end

      it "enables Rails Best Practices" do
        defaults[:metrics][:rails_best_practices].should be_true
      end

      it "enables Churn" do
        defaults[:metrics][:churn].should be_true
      end

    end

    context "on Ruby 1.8.6" do

      before { subject.stub(:ruby).and_return("1.8.6") }

      it "enables Saikuro" do
        defaults[:metrics][:saikuro].should be_true
      end

      it "enables RCov" do
        defaults[:metrics][:rcov].should be_true
      end

    end

    context "on Ruby 1.8.7" do

      before { subject.stub(:ruby).and_return("1.8.7") }

      it "enables Saikuro" do
        defaults[:metrics][:saikuro].should be_true
      end

      it "enables RCov" do
        defaults[:metrics][:rcov].should be_true
      end

    end

    context "on Ruby 1.9.2" do

      before { subject.stub(:ruby).and_return("1.9.2") }

      it "enables Saikuro" do
        defaults[:metrics][:saikuro].should be_false
      end

      it "disables RCov" do
        defaults[:metrics][:rcov].should be_false
      end

    end

    context "on Ruby 1.9.3" do

      before { subject.stub(:ruby).and_return("1.9.3") }

      it "disables Saikuro" do
        defaults[:metrics][:saikuro].should be_false
      end

      it "disables RCov" do
        defaults[:metrics][:rcov].should be_false
      end

    end

  end

  describe ".parse" do

    it "turns open in browser off" do
      subject.parse(["--no-open"])[:open].should be_false
    end

    it "turns open in browser on" do
      subject.parse(["--open"])[:open].should be_true
    end

    # MetricFu doesn't include Saikuro on 1.9.2 (it is broken on 1.9 anyway)
    # https://github.com/jscruggs/metric_fu/blob/master/lib/base/configuration.rb#L12
    unless RUBY_VERSION == "1.9.2"

      it "turns saikuro off" do
        subject.parse(["--no-saikuro"])[:metrics][:saikuro].should be_false
      end

      it "turns saikuro on" do
        subject.parse(["--saikuro"])[:metrics][:saikuro].should be_true
      end

    end

    it "turns churn off" do
      subject.parse(["--no-churn"])[:metrics][:churn].should be_false
    end

    it "turns churn on" do
      subject.parse(["--churn"])[:metrics][:churn].should be_true
    end

    it "turns flay off" do
      subject.parse(["--no-flay"])[:metrics][:flay].should be_false
    end

    it "turns flay on" do
      subject.parse(["--flay"])[:metrics][:flay].should be_true
    end

    it "turns flog off" do
      subject.parse(["--no-flog"])[:metrics][:flog].should be_false
    end

    it "turns flog on" do
      subject.parse(["--flog"])[:metrics][:flog].should be_true
    end

    it "turns hotspots off" do
      subject.parse(["--no-hotspots"])[:metrics][:hotspots].should be_false
    end

    it "turns hotspots on" do
      subject.parse(["--hotspots"])[:metrics][:hotspots].should be_true
    end

    it "turns rcov off" do
      subject.parse(["--no-rcov"])[:metrics][:rcov].should be_false
    end

    it "turns rcov on" do
      subject.parse(["--rcov"])[:metrics][:rcov].should be_true
    end

    it "turns reek off" do
      subject.parse(["--no-reek"])[:metrics][:reek].should be_false
    end

    it "turns reek on" do
      subject.parse(["--reek"])[:metrics][:reek].should be_true
    end

    it "turns roodi off" do
      subject.parse(["--no-roodi"])[:metrics][:roodi].should be_false
    end

    it "turns roodi on" do
      subject.parse(["--roodi"])[:metrics][:roodi].should be_true
    end

  end

end
