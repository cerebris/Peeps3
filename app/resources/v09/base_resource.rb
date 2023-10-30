class V09::BaseResource
  include JSONAPI::ResourceCommon
  resource_retrieval_strategy 'JSONAPI::ActiveRelationRetrievalV09'
  root_resource
end
