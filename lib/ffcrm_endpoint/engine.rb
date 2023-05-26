module FfcrmEndpoint
  class Engine < ::Rails::Engine

    config.to_prepare do
      require "ffcrm_endpoint/endpoint"

      ActiveSupport.on_load(:fat_free_crm_view_factory) do
        tab_urls = ::FatFreeCRM::Tabs.admin.map{|tab| tab[:url]}.map{|url| url[:controller]}
        unless tab_urls.include? 'admin/ffcrm_endpoint'
          tab_urls = tab_urls.dup << { url: { controller: "admin/ffcrm_endpoint" }, text: "Endpoints", icon: 'fa-long-arrow-down'}
          ::FatFreeCRM::Tabs.admin = tab_urls
        end
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
