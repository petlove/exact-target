# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exact-target/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Spike Ilacqua"]
  gem.email         = ["spike@dojo4.com"]
  gem.description   = %q{Send emails using ExactTarget}
  gem.summary       = %q{Send emails using the ExactTarget Triggered Send API}
  gem.homepage      = "https://github.com/dojo4/exact-target"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "exact-target"
  gem.require_paths = ["lib"]
  gem.version       = ExactTarget::VERSION
end
