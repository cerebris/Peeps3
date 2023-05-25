class Contact < ApplicationRecord
  has_many :phone_numbers
  has_many :images, as: :imageable

  ### Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
end
