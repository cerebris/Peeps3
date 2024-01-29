class V11::ContactResource < V11::BaseResource
  attributes :first_name, :last_name, :full_name, :nick_name, :email, :public

  has_many :phone_numbers
  has_many :images, inverse_relationship: :imageable
  has_one :user

  def full_name
    "#{@model.first_name} #{@model.last_name}"
  end

  def fetchable_fields
    if context.fetch(:guest, true)
      super - [:email]
    else
      super
    end
  end

  def self.creatable_fields(context)
    fields = super + [:id]
    if context.fetch(:guest, true)
      fields - [:email]
    else
      fields
    end
  end
end
