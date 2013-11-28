class Admin::FfcrmEndpointController < Admin::ApplicationController

  before_filter :require_user
  before_filter "set_current_tab('admin/ffcrm_endpoint')", :only => [ :index ]

  # GET /admin/ffcrm_endpoint
  #----------------------------------------------------------------------------
  def index
    @endpoints = FfcrmEndpoint::Endpoint.klasses
  end

end
