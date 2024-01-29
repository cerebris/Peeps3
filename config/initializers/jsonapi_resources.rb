JSONAPI.configure do |config|
  # Set the retrieval strategy in the resource base classes to allow testing of different strategies. So we will set
  # the default to :none to prevent trying to load two competing modules
  config.default_resource_retrieval_strategy = :none

  config.resource_key_type = :uuid

  if Rails.application.config.action_controller.perform_caching
    config.resource_cache = Rails.cache if Rails.application.config.cache_store
    config.default_caching = true
  end

  # Options are :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged
  config.default_page_size = 10
  config.maximum_page_size = 2000

  # config.related_identities_set = SortedSet
end
