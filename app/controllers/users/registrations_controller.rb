class Users::RegistrationsController < Devise::RegistrationsController

  # アバターだけ更新するとき、パスワード不要
  protected
  def update_resource(resource, params)
    if params[:password].present? || params[:password_confirmation].present?
      super
    else
      resource.update_without_password(params.except(:current_password))
    end
  end
end
