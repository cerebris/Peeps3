class V09::ImageableResource < V09::BaseResource
  abstract
  polymorphic
  has_one :image
end
