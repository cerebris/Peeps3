class User < ApplicationRecord
  has_many :images, as: :imageable
  has_many :contacts
end
