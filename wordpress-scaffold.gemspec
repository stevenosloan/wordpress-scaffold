require File.expand_path( "../lib/wordpress-scaffold/version", __FILE__ )

Gem::Specification.new do |gem|

  gem.name           = 'wordpress-scaffold'
  gem.version        = Wordpress::Scaffold::VERSION
  gem.platform       = Gem::Platform::RUBY

  gem.summary        = 'Common patterns & ruby workflow applied for wordpress development'
  gem.description    = %q{ Common patterns & ruby workflow applied for wordpress development }
  gem.authors        = ["Steven Sloan"]
  gem.email          = "stevenosloan@gmail.com"
  gem.homepage       = "http://github.com/stevenosloan/wordpress-scaffold"
  gem.license        = 'MIT'

  gem.required_ruby_version = ">= 2.0.0"
  gem.platform              = Gem::Platform::RUBY

  gem.files          = Dir[ "{scaffold,doc,lib}/**/*", "readme.md", "changelog.md" ]
  gem.test_files     = Dir[ "spec/**/*.rb" ]
  gem.require_path   = "lib"
  gem.executable     = "wp-scaffold"

  gem.add_dependency "thor"
  gem.add_dependency "borrower"

end