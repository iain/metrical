# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metrical/version"

Gem::Specification.new do |s|
  s.name        = "metrical"
  s.version     = Metrical::VERSION
  s.authors     = ["iain"]
  s.email       = ["iain@iain.nl"]
  s.homepage    = "https://github.com/iain/metrical"
  s.summary     = %q{Run metric_fu without making it a project dependency}
  s.description = %q{MetricFu is awesome! The only problem is that it's kinda obtrusive. Metrical provides a executable so you can run metric fu on any project without making changes to the project.}

  s.rubyforge_project = "metrical"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "metric_fu"
  s.add_runtime_dependency "rcov", "~> 0.9"
  s.add_development_dependency "rspec", "~> 2.8"
end
