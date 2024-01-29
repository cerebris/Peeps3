class V11::ImageResource < V11::BaseResource
  attributes :file_name
  has_one :imageable, polymorphic: true
end
