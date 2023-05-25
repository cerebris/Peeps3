JSONAPI.configure do |config|
  config.resource_key_type = :uuid

  config.resource_cache = Rails.cache
  config.default_caching = true

  # Options are :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged # default is :none

  config.default_page_size = 10
  config.maximum_page_size = 100

  # config.default_included_strategy = :through_parent_resource_0_10
  # config.default_related_strategy = :through_parent_resource_0_10
end
