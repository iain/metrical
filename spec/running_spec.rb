require 'spec_helper'

describe Metrical, "running" do

  around do |example|
    stdin, stdout, stderr = Open3.popen3("metrical --no-open")
    @stdout = stdout.read
    @stderr = stderr.read
    example.run
  end

  it "loads the .metrics file" do
    @stdout.should include "Metrics config loaded"
  end

end
