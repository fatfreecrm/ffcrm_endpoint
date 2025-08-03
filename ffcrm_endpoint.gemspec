$:.push File.expand_path("lib", __dir__)

require "ffcrm_endpoint/version"

Gem::Specification.new do |s|
  s.name        = "ffcrm_endpoint"
  s.version     = FfcrmEndpoint::VERSION
  s.authors     = ["Steve Kenworthy"]
  s.email       = ["steveyken@gmail.com"]
  s.homepage    = "http://www.fatfreecrm.com"
  s.summary     = "Enables Fat Free CRM to receive webhooks"
  s.licenses    = "MIT"
  s.description = "A framework for quickly writing an endpoint to consume webhooks from other systems."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.required_ruby_version = ">= 3.0"

  s.add_dependency "rails"
  s.add_dependency "fat_free_crm"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "listen"
end
