Gem::Specification.new do |s|

  s.name             = "metrical"
  s.version          = "0.0.3"
  s.summary          = "Run metric_fu without making it a project dependency"
  s.email            = "iain@iain.nl"
  s.homepage         = "http://github.com/iain/metrical/"
  s.description      = "MetricFu is awesome! The only problem is that it's kinda obtrusive. Metrical provides a executable so you can run metric fu on any project without making changes to the project."
  s.authors          = ["Iain Hecker"]
  s.files            = [ "README.rdoc", 'bin/metrical' ]
  s.has_rdoc         = true
  s.rdoc_options     = ["--main", "README.rdoc"]
  s.extra_rdoc_files = []
  s.executables      = ["metrical"]

  s.add_dependency "metric_fu", "~> 1.5.1"
  s.add_dependency "activesupport"
end
