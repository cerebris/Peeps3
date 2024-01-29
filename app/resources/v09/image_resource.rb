class V09::ImageResource < V09::BaseResource
  attributes :file_name
  has_one :imageable, polymorphic: true
end

