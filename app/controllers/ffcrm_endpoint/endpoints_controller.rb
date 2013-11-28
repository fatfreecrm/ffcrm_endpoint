module FfcrmEndpoint

  class EndpointsController < ActionController::Base

    respond_to :json, :js, :html

    def consume

      if endpoint.authenticate
        endpoint.process
        respond_with('', location: nil, status: 201)
      else
        respond_with('', location: nil, status: :unauthorized)
      end

    end

    private

    def endpoint
      @endpoint ||= FfcrmEndpoint::Endpoint.new(request)
    end

  end

end
