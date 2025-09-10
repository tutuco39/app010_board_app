class ApplicationController < ActionController::Base
  include Pagy::Backend

  # 全コントローラ共通でログイン必須
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(_resource)  = topics_path
  def after_sign_out_path_for(_resource) = topics_path

  def after_sign_in_path_for(_resource)
    topics_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    topics_path
  end

  def after_sign_up_path_for(_resource)
    topics_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :email, :password, :password_confirmation, :current_password])
  end

end
