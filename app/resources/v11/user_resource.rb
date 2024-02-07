class V11::UserResource < V11::BaseResource
  attributes :user_name, :first_name, :last_name, :email

  has_many :contacts, inverse_relationship: :creator
  has_many :images
end
