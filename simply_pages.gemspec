$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simply_pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simply_pages"
  s.version     = SimplyPages::VERSION
  s.authors     = ["Jan Rietema"]
  s.email       = ["jan.rietema@web.de"]
  s.homepage    = "github.com/jrietema/simply_pages"
  s.summary     = "Simply Pages is a Rails Engine to provide minimal functionality for editable HTML content & media and WYSIWYG editing."
  s.description = "TODO: Description of SimplyPages."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"
  s.add_dependency "paperclip"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
