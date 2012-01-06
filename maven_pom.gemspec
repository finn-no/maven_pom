# -*- encoding: utf-8 -*-
require File.expand_path('../lib/maven_pom/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jari Bakken"]
  gem.email         = ["jari.bakken@finn.no"]
  gem.description   = %q{Tiny library to work with Maven's pom.xml files from Ruby.}
  gem.summary       = %q{Tiny library to work with Maven's pom.xml files from Ruby.}
  gem.homepage      = "http://github.com/finn-no/maven_pom"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "maven_pom"
  gem.require_paths = ["lib"]
  gem.version       = MavenPom::VERSION

  gem.add_dependency "nokogiri", "~> 1.5.0"
  gem.add_dependency "rgl", "~> 0.4.0"
  gem.add_development_dependency "rspec", "~> 2.0"
end
