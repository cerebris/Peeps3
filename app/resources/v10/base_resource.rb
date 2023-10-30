class V10::BaseResource
  include JSONAPI::ResourceCommon
  resource_retrieval_strategy 'JSONAPI::ActiveRelationRetrievalV10'
  root_resource
end
