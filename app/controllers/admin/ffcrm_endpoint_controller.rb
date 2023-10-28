class Admin::FfcrmEndpointController < Admin::ApplicationController

  before_action -> { set_current_tab('admin/ffcrm_endpoint') }, only: [ :index ]

  # GET /admin/ffcrm_endpoint
  #----------------------------------------------------------------------------
  def index
    @endpoints = FfcrmEndpoint::Endpoint.klasses
  end

end
