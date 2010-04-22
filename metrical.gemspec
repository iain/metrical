Gem::Specification.new do |s|

  s.name             = "metrical"
  s.version          = "0.0.2"
  s.summary          = "Run MetricFu on any project easisly"
  s.email            = "iain@iain.nl"
  s.homepage         = "http://github.com/iain/metrical/"
  s.description      = "MetricFu is awesome! The only problem is that it's kinda obtrusive. Metrical provides a executable so you can run metric fu on any project without making changes to the project."
  s.authors          = ["Iain Hecker"]
  s.files            = [ "README.rdoc", 'bin/metrical' ]
  s.has_rdoc         = true
  s.rdoc_options     = ["--main", "README.rdoc"]
  s.extra_rdoc_files = []
	s.executables			 = ["metrical"]

	s.add_dependency "metric_fu", "~> 1.3.0"
	s.add_dependency "reek",			">= 1.2.7"
	s.add_dependency "roodi",			">= 2.1.0"
end
