class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      admin_root_path
    else
      root_path
    end
  end

  def user_not_authorized
    redirect_to root_path, notice: 'You are not authorized to perform this action'
  end
end
