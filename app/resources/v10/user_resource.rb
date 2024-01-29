class V10::UserResource < V10::BaseResource
  attributes :user_name, :first_name, :last_name, :email

  has_many :contacts
  has_many :images
end
