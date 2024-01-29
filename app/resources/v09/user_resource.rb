class V09::UserResource < V09::BaseResource
  attributes :user_name, :first_name, :last_name, :email

  has_many :contacts
  has_many :images, inverse_relationship: :imageable
end
