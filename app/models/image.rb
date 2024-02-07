class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user,-> { left_joins(:images).where(images: {imageable_type: 'User'}) }, foreign_key: 'imageable_id', optional: true
  belongs_to :contact,-> { left_joins(:images).where(images: {imageable_type: 'Contact'}) }, foreign_key: 'imageable_id', optional: true

  ### Scopes
  scope :public_images, -> { left_joins(:contact).where(contacts: { public: true }) }

  # User images are images of contacts created by the user
  scope :user_images, ->(user) { left_joins(:contact).where(contacts: { created_by_user_id: user }) }

  ### Authorization Scopes, will be called by the resource based on the current user
  scope :for_user, ->(user, _options) { user_images(user).or(public_images) }
  scope :for_unauthenticated, ->(_options) { public_images }
end
