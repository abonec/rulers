# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rulers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["abonec"]
  gem.email         = ["abonec@gmail.com"]
  gem.description   = %q{A Rack-based Web Framework}
  gem.summary       = %q{A Rack-based Web Framework,
                        but with extra awesome}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rulers"
  gem.require_paths = ["lib"]
  gem.version       = Rulers::VERSION
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "debugger"
  gem.add_runtime_dependency "rack"
end
