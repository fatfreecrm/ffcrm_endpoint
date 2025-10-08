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
      raise 'Should not be called'
    end
  end

  describe 'consume' do
    context 'authenticated' do
      it 'call processes the request' do
        get :consume, params: { klass_name: :authenticating_endpoint, format: :js }
        expect(response.status).to eql(201)
      end
    end

    context 'unauthenticated' do
      it 'rejects the request' do
        get :consume, params: { klass_name: :non_authenticating_endpoint, format: :js }
        expect(response.status).to eql(401)
      end
    end
  end
end
