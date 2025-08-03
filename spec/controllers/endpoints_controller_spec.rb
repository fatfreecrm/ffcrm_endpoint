require 'rails_helper'

RSpec.describe FfcrmEndpoint::EndpointsController, type: :controller do
  let(:endpoint) { double(FfcrmEndpoint::Endpoint) }

  class AuthenticatingEndpoint < FfcrmEndpoint::Endpoint
    def authenticate
      true
    end

    def process
      # Simulate processing logic
    end
  end

  class NonAuthenticatingEndpoint < FfcrmEndpoint::Endpoint
    def authenticate
      false
    end

    def process
      raise "Should not be called"
    end
  end

  describe 'consume' do
    it 'should call process when authenticate returns true' do
      post :consume, params: { klass_name: :authenticating_endpoint, format: :js }
      expect(response.status).to eql(201)
    end

    it 'should not call process when authenticate returns false' do
      post :consume, params: { klass_name: :non_authenticating_endpoint, format: :js }
      expect(response.status).to eql(401)
    end
  end
end
