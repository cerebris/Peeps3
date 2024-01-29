class V10::ImageResource < V10::BaseResource
  attributes :file_name
  has_one :imageable, polymorphic: true
end
