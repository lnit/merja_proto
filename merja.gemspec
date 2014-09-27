$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "merja/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "merja"
  s.version     = Merja::VERSION
  s.authors     = ["lnilni"]
  s.email       = ["developer.lni@gmail.com"]
  s.homepage    = "https://github.com/lnilni/merja"
  s.summary     = "Module of Searching directory from public directory"
  s.description = "Merja supports searching directory. When you pass a filepath to her, she search accessible directory from app's public directory and return it."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "rspec"
end
