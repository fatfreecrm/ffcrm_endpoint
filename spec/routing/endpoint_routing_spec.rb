require 'rails_helper'

describe 'EndpointsController', type: :routing do
  it 'generates endpoint route for custom action [GET]' do
    expect(get: 'endpoints/custom').to route_to(controller: 'ffcrm_endpoint/endpoints', action: 'consume',
                                                klass_name: 'custom')
  end

  it 'generates endpoint route for custom action [GET]' do
    expect(get: 'endpoints/custom').to route_to(controller: 'ffcrm_endpoint/endpoints', action: 'consume',
                                                klass_name: 'custom')
  end

  it 'generates endpoint route for custom action [POST]' do
    expect(post: 'endpoints/custom').to route_to(controller: 'ffcrm_endpoint/endpoints', action: 'consume',
                                                 klass_name: 'custom')
  end

  it 'generates endpoint route for custom action [PUT]' do
    expect(put: 'endpoints/custom').to route_to(controller: 'ffcrm_endpoint/endpoints', action: 'consume',
                                                klass_name: 'custom')
  end

  it 'generates endpoint route for custom action [PUT]' do
    expect(put: 'endpoints/custom').to route_to(controller: 'ffcrm_endpoint/endpoints', action: 'consume',
                                                klass_name: 'custom')
  end
end
