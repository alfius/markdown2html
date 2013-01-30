# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gollum/export/version'

Gem::Specification.new do |gem|
  gem.name          = "gollum-export"
  gem.version       = Gollum::Export::VERSION
  gem.authors       = ["Alfonso Cora"]
  gem.email         = ["acora6@gmail.com"]
  gem.description   = %q{This gem includes the `gollum-export` command that allows converting local markdown files to html. It also includes a switch to download and convert a full wiki from a github repo.}
  gem.summary       = %q{Downloads Gollum wikis and converts them to HTML}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'html-pipeline', '~> 0.0.6'
  gem.add_development_dependency 'rspec', '~> 2.12.0'
end
