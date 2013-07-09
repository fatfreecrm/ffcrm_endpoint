require 'spec_helper'

describe EndpointsController do

  describe "routing" do

    it "generates endpoint route for custom action [GET]" do
      expect(:get => "endpoints/custom").to route_to(:controller => "endpoints", :action => "custom")
    end

    it "generates endpoint route for custom action [POST]" do
      expect(:post => "endpoints/custom").to route_to(:controller => "endpoints", :action => "custom")
    end

    it "generates endpoint route for custom action [PUT]" do
      expect(:put => "endpoints/custom").to route_to(:controller => "endpoints", :action => "custom")
    end

  end

end
