class Contact < ApplicationRecord
  has_many :phone_numbers
  has_many :images, as: :imageable

  belongs_to :user, foreign_key: "created_by_user_id"

  ### Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  ### Scopes
  scope :public_contacts, -> { where(public: true) }
  scope :user_contacts, ->(user) { where(user: user) }

  ### Authorization Scopes, will be called by the resource based on the current user
  scope :for_user, ->(user, _options) { user_contacts(user).or(public_contacts) }
  scope :for_unauthenticated, ->(_options) { public_contacts }
end
