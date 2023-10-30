JSONAPI.configure do |config|
  config.resource_key_type = :uuid

  config.resource_cache = Rails.cache
  config.default_caching = true

  # Options are :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged # default is :none

  config.default_page_size = 10
  config.maximum_page_size = 2000
  config.default_resource_retrieval_strategy = :none
end
