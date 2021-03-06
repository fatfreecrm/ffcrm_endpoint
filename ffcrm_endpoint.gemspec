$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ffcrm_endpoint/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ffcrm_endpoint"
  s.version     = FfcrmEndpoint::VERSION
  s.authors     = ["Steve Kenworthy"]
  s.email       = ["steveyken@gmail.com"]
  s.homepage    = "http://www.fatfreecrm.com"
  s.summary     = "Enables Fat Free CRM to receive webhooks"
  s.licenses    = "MIT-LICENSE"
  s.description = "A framework for quickly writing an endpoint to consume webhooks from other systems."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "pg"
end
