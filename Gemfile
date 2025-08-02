source "https://rubygems.org"

gemspec

gem "fat_free_crm", "~> 0.24.1"
gem 'responds_to_parent', git: 'https://github.com/CloCkWeRX/responds_to_parent.git', branch: 'master' # Temporarily pointed at git until https://github.com/zendesk/responds_to_parent/pull/7 is released
gem 'acts_as_commentable', git: 'https://github.com/fatfreecrm/acts_as_commentable.git', tag: "7.1.0"
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