module FfcrmEndpoint

  class EndpointsController < ActionController::Base

    def consume

      if endpoint.authenticate
        endpoint.process
        render plain: '', status: 201
      else
        render plain: '', status: 401
      end

    end

    private

    def endpoint
      @endpoint ||= FfcrmEndpoint::Endpoint.new(request)
    end

  end

end
