require 'bundler/setup'
require 'metrical'

RSpec::Matchers.define :create_file do |expected|

  match do |block|
    fail "The file #{expected} was already present before the block" if File.exist?(expected)
    block.call
    if File.exist?(expected)
      true
    else
      system "ls #{File.dirname(expected)}"
      false
    end
  end

end
