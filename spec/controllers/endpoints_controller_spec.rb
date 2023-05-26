require 'rails_helper'

describe FfcrmEndpoint::EndpointsController do

  let(:endpoint) { double(FfcrmEndpoint::Endpoint) }

  describe "consume" do

    it "should call process when authenticate returns true" do
      expect(endpoint).to receive(:process)
      expect(endpoint).to receive(:authenticate).and_return(true)
      allow(controller).to receive(:endpoint).and_return(endpoint)
      get :consume, params: { klass_name: :my_custom_endpoint, format: :js }
      expect(response.status).to eql(201)
    end

    it "should not call process when authenticate returns false" do
      expect(endpoint).to_not receive(:process)
      expect(endpoint).to receive(:authenticate).and_return(false)
      allow(controller).to receive(:endpoint).and_return(endpoint)
      get :consume, params: { klass_name: :my_custom_endpoint, format: :js }
      #~ expect(response.status).to eql(401)
    end

  end

end
