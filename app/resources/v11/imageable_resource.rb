class V11::ImageableResource < V11::BaseResource
  abstract
  polymorphic
  has_one :contact
  has_one :user
end
