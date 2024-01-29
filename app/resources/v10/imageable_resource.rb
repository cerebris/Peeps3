class V10::ImageableResource < V10::BaseResource
  abstract
  polymorphic
  has_one :image
end
