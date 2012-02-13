require 'metrical/options'

module Metrical

  def self.cli(argv)
    run Options.parse(argv)
  end

end
