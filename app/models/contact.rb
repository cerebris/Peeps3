class Contact < ApplicationRecord
  has_many :phone_numbers
  has_many :images, as: :imageable

  belongs_to :creator, foreign_key: "created_by_user_id", class_name: "User"

  ### Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  ### Scopes
  scope :public_contacts, -> { where(public: true) }
  scope :user_contacts, ->(user) { where(created_by_user_id: user) }

  ### Authorization Scopes, will be called by the resource based on the current user
  scope :for_user, ->(user, _options) { user_contacts(user).or(public_contacts) }
  scope :for_unauthenticated, ->(_options) { public_contacts }
end
