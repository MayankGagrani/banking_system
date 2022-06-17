# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])
    if user.present?
      if user.role == "admin" || "manager"
        super
      else
        if user.account.verify == true 
          super
        else
          flash[:error] = "You will not able to login untill your account will be verified by bank"
          redirect_to new_user_session_path
        end
      end 
    else 
      flash[:error] = "User does not exist"
      redirect_to new_user_session_path
    end  
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

   def after_sign_in_path_for(resource)
    if resource.role == "admin"
      users_path
    elsif resource.role == "manager"
      users_path
    else
      home_index_path
    end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
