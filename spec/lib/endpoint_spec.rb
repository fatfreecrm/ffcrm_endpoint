require 'rails_helper'
require 'action_dispatch/testing/test_request'

describe FfcrmEndpoint::Endpoint do
  describe 'initialize' do
    it 'should initialize params'

    context 'with an incomplete request' do
      it 'should raise an error if action is blank' do
        expect do
          FfcrmEndpoint::Endpoint.new(ActionDispatch::TestRequest.create)
        end.to raise_error(FfcrmEndpoint::EndpointNoActionError)
      end
    end
  end

  describe 'process' do
    it 'should find the subclass'

    it 'should call process on the subclass'

    context 'with an unrecognised handler' do
      let(:test_request) do
        test_request = ActionDispatch::TestRequest.create
        test_request.request_method = 'POST'
        test_request.path = '/example'
        test_request.set_header('HTTP_AUTHORIZATION', 'Bearer testtoken123')
        test_request.request_parameters = { klass_name: 'DoesntExist' }
        test_request
      end

      let(:endpoint) do
        FfcrmEndpoint::Endpoint.new(test_request)
      end

      it 'raises an error if it cannot find the subclass' do
        expect { endpoint.process }.to raise_error(FfcrmEndpoint::EndpointNotDefinedError)
      end
    end
  end

  describe 'config' do
    it 'should provide access to subclass settings'
  end

  it 'should register a subclass'
  it 'should return the subclass class'
  it 'should return the subclass class name'
end
