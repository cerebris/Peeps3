class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Authenticated Scopes
  scope :for_admin, ->(_admin, _options) { all }
  scope :for_user, ->(_user, _options) { none }
  scope :for_unauthenticated, ->(_options) { none }
end
