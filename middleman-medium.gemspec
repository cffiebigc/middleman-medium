# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-medium"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carlos Fiebig"]
  s.email       = ["cffiebigc@gmail.com"]
  # s.homepage    = "http://example.com"
  s.summary     = %q{Fetch medium posts from feed}
  s.description = %q{Fetch medium posts from feed}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.2.1"])
  s.add_runtime_dependency('nokogiri', '~> 1.8', '>= 1.8.2')
  
  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
