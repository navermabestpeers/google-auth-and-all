# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   auth =request.env["omniauth.auth"]
  #   session[:omniauth]=auth.except('extra')
  #   user= User.sign_in_from_omniauth(auth)
  #   session[:user_id] = user.id
  #   redirect_to root_url, notice: "Signed In"
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   session[:user_id] = nil
  #   session[:omniauth] = nil
  #   redirect-to root_url, notice: "Signed Out"
  # end
  #---------------------------------------------------
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end
  # protected
  #-----------------------------------------------------------
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
