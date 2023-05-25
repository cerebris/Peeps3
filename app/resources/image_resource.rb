class ImageResource < BaseResource
  attributes :file_name
  has_one :imageable, polymorphic: true
  has_one :user
  has_one :contact
end
