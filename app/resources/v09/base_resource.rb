class V09::BaseResource
  include JSONAPI::ResourceCommon
  resource_retrieval_strategy 'JSONAPI::ActiveRelationRetrievalV09'
  root_resource

  class << self
    alias original_records records

    def user_records(user, options)
      original_records(options).for_user(user, options)
    end

    def admin_records(admin, options)
      original_records(options).for_admin(admin, options)
    end

    def unauthenticated_records(options)
      original_records(options).for_unauthenticated(options)
    end

    def records(options = {})
      context = options[:context]
      current_user = context[:current_user]

      if current_user.nil?
        unauthenticated_records(options)
      elsif current_user.admin?
        admin_records(current_user, options)
      else
        user_records(current_user, options)
      end
    end
  end
end
