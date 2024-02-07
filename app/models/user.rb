class User < ApplicationRecord
  has_many :images, as: :imageable
  has_many :contacts, foreign_key: "created_by_user_id"
  # has_one :preference
end
