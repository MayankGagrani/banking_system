class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	before_action :configure_permitted_parameters, if: :devise_controller?
  
	# def after_sign_in_path_for(resource)
 #    binding.pry
 #    home_index_path
 #  end

	protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name,:father_name,:mother_name,:father_occupation,:mother_occupation,:occupation,:mobile_number, :aadhar_no,:pan_no, :role, :gender, :email, :password, :password_confirmation,:bank_id,local_address_attributes: [:id,:destroy,:house_name,:street_no,:area,:city,:state,:country,:pin_code,:address_proof],permanent_address_attributes: [:id,:destroy,:house_name,:street_no,:area,:city,:state,:country,:pin_code,:address_proof], bank_attributes: [:id, :bank_name, :destroy])}

	end

end
