JSONAPI.configure do |config|
  config.resource_key_type = :uuid

  if Rails.application.config.action_controller.perform_caching
    config.resource_cache = Rails.cache if Rails.application.config.cache_store
    config.default_caching = true
  end

  # Options are :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged # default is :none

  # config.processor_klass = JSONAPI::AuthorizingProcessor

  config.default_page_size = 10
  config.maximum_page_size = 2000
  config.default_resource_retrieval_strategy = :none


  config.default_find_related_through = :inverse
  config.default_find_related_through_polymorphic = :inverse
end
