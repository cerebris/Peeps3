class UserResource < BaseResource
  attributes :user_name, :first_name, :last_name, :email

  has_many :contacts
  has_many :images
end
