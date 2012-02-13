# -*- encoding: utf-8 -*-
require File.expand_path('../lib/metrical/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["iain"]
  gem.email         = ["iain@iain.nl"]
  gem.description   = %q{Static code analysis for the masses. Aiming to replace metric_fu.}
  gem.summary       = %q{Static code analysis for the masses}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "metrical"
  gem.require_paths = ["lib"]
  gem.version       = Metrical::VERSION


  gem.add_dependency "flay", "~> 1.4.3"
  gem.add_dependency "flog", "~> 2.5.3"

  gem.add_development_dependency "rspec", "~> 2.8"
end
