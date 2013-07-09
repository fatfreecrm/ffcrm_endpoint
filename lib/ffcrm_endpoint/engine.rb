module FfcrmEndpoint
  class Engine < ::Rails::Engine

    config.to_prepare do
       require "ffcrm_endpoint/endpoint"
    end

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
