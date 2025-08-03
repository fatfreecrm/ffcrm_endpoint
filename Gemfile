source "https://rubygems.org"

gemspec

gem "fat_free_crm", git: 'https://github.com/fatfreecrm/fat_free_crm.git', branch: 'v0.24.x'
gem 'sprockets', '~> 4.0'

group :development, :test do
  gem "jquery-rails" # jquery-rails is used by the dummy application
  gem "factory_bot_rails"
  gem "byebug" unless ENV["CI"]
end
gem "mutex_m"
gem "bigdecimal"
gem "ransack_ui"
gem "csv"
gem "observer"