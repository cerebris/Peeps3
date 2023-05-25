class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user,-> { where(images: {imageable_type: 'User'}) }, foreign_key: 'imageable_id'
  belongs_to :contact,-> { where(images: {imageable_type: 'Contact'}) }, foreign_key: 'imageable_id'
end
