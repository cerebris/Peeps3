require 'jsonapi/routing_ext'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  UUID_regex = /[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}(,[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})*/

  namespace :v09, defaults: { format: 'json' } do
    jsonapi_resources :contacts, constraints: {:id => UUID_regex}
    jsonapi_resources :phone_numbers, constraints: {:id => UUID_regex}
    jsonapi_resources :users, constraints: {:id => UUID_regex}
    jsonapi_resources :images, constraints: {:id => UUID_regex}
  end

  namespace :v10, defaults: { format: 'json' } do
    jsonapi_resources :contacts, constraints: {:id => UUID_regex}
    jsonapi_resources :phone_numbers, constraints: {:id => UUID_regex}
    jsonapi_resources :users, constraints: {:id => UUID_regex}
    jsonapi_resources :images, constraints: {:id => UUID_regex}
  end

  namespace :v11, defaults: { format: 'json' } do
    jsonapi_resources :contacts, constraints: {:id => UUID_regex}
    jsonapi_resources :phone_numbers, constraints: {:id => UUID_regex}
    jsonapi_resources :users, constraints: {:id => UUID_regex}
    jsonapi_resources :images, constraints: {:id => UUID_regex}
  end
end
