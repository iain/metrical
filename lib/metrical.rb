require "metrical/version"
require "metrical/options"

require 'rubygems'
require 'json'
require 'metric_fu'

# Required for RCOV
require 'active_support'
require 'active_support/core_ext'

module Metrical
  extend self

  def run(argv)
    options = Options.parse(argv)
    load_defaults
#    set_new_rcov_defaults
    load_user_configuration
    disable_metrics(options)
    run_metric_fu
    open_in_browser if options[:open]
  end

  private

  def disable_metrics(options)
    options[:metrics].each do |metric, chosen|
      unless chosen
        MetricFu.configuration.metrics -= [ metric ]
        MetricFu.configuration.graphs -= [ metric ]
      end
    end
  end

  def load_defaults
    MetricFu::Configuration.run {}
  end

  def set_new_rcov_defaults
    test_files = Dir['{spec,test}/**/*_{spec,test}.rb']
    MetricFu::Configuration.run do |config|
      config.rcov[:test_files] = test_files
      config.rcov[:rcov_opts] = [
        "--sort coverage",
        "--no-html",
        "--text-coverage",
        "--no-color",
        "--profile",
        "--exclude-only '.*'",
        '--include-file "\Aapp,\Alib"'
      ]
      config.rcov[:rcov_opts] << "-Ispec" if File.exist?("spec")
    end
  end

  def load_user_configuration
    file = File.join(Dir.pwd, '.metrics')
    load file if File.exist?(file)
  end

  def run_metric_fu
    MetricFu.metrics.each {|metric| MetricFu.report.add(metric) }
    MetricFu.report.save_output(MetricFu.report.to_yaml, MetricFu.base_directory, "report.yml")
    MetricFu.report.save_output(MetricFu.report.to_yaml, MetricFu.data_directory, "#{Time.now.strftime("%Y%m%d")}.yml")
    MetricFu.report.save_templatized_report

    MetricFu.graphs.each {|graph| MetricFu.graph.add(graph, MetricFu.graph_engine) }
    MetricFu.graph.generate
  end

  def open_in_browser
    if MetricFu.report.open_in_browser?
      MetricFu.report.show_in_browser(MetricFu.output_directory)
    end
  end

end
