class ApplicationController < ActionController::Base
  include Pagy::Backend

  # 全コントローラ共通でログイン必須
  before_action :authenticate_user!

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
end
