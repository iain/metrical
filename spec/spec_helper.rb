require 'bundler/setup'
require 'metrical'

RSpec::Matchers.define :create_file do |expected|

  match do |actual|
    File.exist?(expected)
  end

end
