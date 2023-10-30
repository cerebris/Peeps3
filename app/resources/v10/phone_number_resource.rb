class V10::PhoneNumberResource < V10::BaseResource
  attributes :name, :phone_number
  has_one :contact

  filter :contact

  def self.creatable_fields(context)
    super + [:id]
  end
end
