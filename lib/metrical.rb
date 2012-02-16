require 'metrical/options'
require 'metrical/runner'
require 'metrical/reporter'

module Metrical

  def self.cli(argv)
    configuration = Configuration.new
    Options.parse(argv, configuration)
    reports = Runner.run(configuration)
    Reporter.report(reports, configuration)
  end

end
