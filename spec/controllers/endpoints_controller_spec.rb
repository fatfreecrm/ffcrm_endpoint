require 'spec_helper'

describe EndpointsController do

  let(:endpoint) { mock(FfcrmEndpoint::Endpoint) }

  describe "consume" do

    it "should call process when authenticate returns true" do
      endpoint.should_receive(:process)
      endpoint.should_receive(:authenticate).and_return(true)
      controller.stub!(:endpoint).and_return(endpoint)
      get :consume, klass_name: :my_custom_endpoint, format: :js
      expect(response.status).to eql(201)
    end

    it "should not call process when authenticate returns false" do
      endpoint.should_not_receive(:process)
      endpoint.should_receive(:authenticate).and_return(false)
      controller.stub!(:endpoint).and_return(endpoint)
      get :consume, klass_name: :my_custom_endpoint, format: :js
      #~ expect(response.status).to eql(401)
    end

  end

end
