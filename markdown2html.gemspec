# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'markdown2html'
  gem.version       = '0.1.1'
  gem.authors       = ['Alf Cora']
  gem.email         = ['alfius@protonmail.com']
  gem.description   = %q{Convert markdown files and wikis to html.}
  gem.summary       = %q{Convert local markdown files or wikis from git repositories to html.}
  gem.homepage      = 'https://github.com/alfonsocora/markdown2html'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'html-pipeline', '~> 2.2', '>= 2.2.2'
  gem.add_runtime_dependency 'github-markdown', '~> 0.6', '>= 0.6.9'
  gem.add_development_dependency 'minitest', '~> 5.8', '>= 5.8.3'
  gem.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
end
