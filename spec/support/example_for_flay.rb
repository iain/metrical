def initialize option = nil
  @option = option || Flay.default_options
  @hashes = Hash.new { |h,k| h[k] = [] }

  self.identical      = {}
  self.masses         = {}
  self.total          = 0
  self.mass_threshold = @option[:mass]

  require 'ruby2ruby' if @option[:diff]
end
def initialize option = nil
  @option = option || Flay.default_options
  @hashes = Hash.new { |h,k| h[k] = [] }

  self.identical      = {}
  self.masses         = {}
  self.total          = 0
  self.mass_threshold = @option[:mass]

  require 'ruby2ruby' if @option[:diff]
end
def initialize option = nil
  @option = option || Flay.default_options
  @hashes = Hash.new { |h,k| h[k] = [] }

  self.identical      = {}
  self.masses         = {}
  self.total          = 0
  self.mass_threshold = @option[:mass]

  require 'ruby2ruby' if @option[:diff]
end

expect { Metrical::Options.parse(["--help"], out) }.to(raise_error(SystemExit))
expect { Metrical::Options.parse(["--version"], out) }.to(raise_error(SystemExit))
