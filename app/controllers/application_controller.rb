class ApplicationController < ActionController::Base
  helper_method :is_admin?

  def is_admin?
    user_signed_in? ? current_user.admin : false
  end
end
