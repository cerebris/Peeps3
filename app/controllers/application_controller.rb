class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  # Using prepend_before_action instead of before_action so that we can ensure this is called before any other
  prepend_before_action :authorize_user_token
  # Do not define any other prepend_before_action callbacks after this comment since it will run before the
  # authorize_user_token method.

  private

  def context
    {
      current_user: @current_user
    }
  end

  def authorize_user_token
    return if request.headers['HTTP_AUTHORIZATION'].blank?

    # Simple auth just by sending the user_name in the Authorization header. This is obviously not secure, but it's
    # fine for this demo app.
    @current_user = User.find_by!(user_name: request.headers['HTTP_AUTHORIZATION'])
  rescue
    head(:unauthorized)
  end
end
