module FfcrmEndpoint
  class Engine < ::Rails::Engine

    config.to_prepare do
      require "ffcrm_endpoint/endpoint"

      tab_urls = FatFreeCRM::Tabs.admin.map{|tab| tab[:url]}.map{|url| url[:controller]}
      unless tab_urls.include? 'admin/ffcrm_endpoint'
        FatFreeCRM::Tabs.admin << { url: { controller: "admin/ffcrm_endpoint" }, text: "Endpoints", icon: 'fa-long-arrow-down'}
      end

    end

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
