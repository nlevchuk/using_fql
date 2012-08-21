$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fql/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "using_fql"
  s.version     = Fql::VERSION
  s.authors     = ["Maarten Claes"]
  s.email       = ["maartencls@gmail.com"]
  s.homepage    = "https://github.com/maartencls/rails-fql"
  s.summary     = "Facebook Query Language"
  s.description = "Allows you to easily use FQL in your Rails app."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  # s.add_dependency "rails", "~> 3.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "fakeweb"
end
