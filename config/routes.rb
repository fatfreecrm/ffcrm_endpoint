Rails.application.routes.draw do

  match 'endpoints/:klass_name', controller: 'ffcrm_endpoint/endpoints', action: 'consume', via: [:get, :post, :put]
  get   '/admin/ffcrm_endpoint' => 'admin/ffcrm_endpoint#index', format: 'html'

end
