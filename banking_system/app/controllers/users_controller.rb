class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		if current_user.role == "admin" || "admin"
			@users = User.all
		else
			redirect_to home_index_path
		end
	end

	def new
		@user = User.new
	end	

	def create_manager
		@user = User.new(user_params)
		@user.role = "manager"
		if @user.save 
			respond_to do |formate|
				formate.html { redirect_to users_path}
			end
		else
		 render :new
		end
	end 
	
	def show 
		
	end

	def verify
		@user = User.find(params[:id])
		@account = @user.account
		if @account.update_attributes(verify: true, verified_by: params[:role]) 
			flash[:notice] = "Account verify successfully"
			UserMailer.send_account_verify_confirmation(@user).deliver_now
			redirect_to users_path
		else
			flash[:error] = "Not update"
		end
	end

	private
	 def user_params
	 	params.require(:user).permit(:first_name,:last_name, :occupation, :father_name,:mother_name, :father_occupation, :mother_occupation, :mobile_number, :aadhar_no,:pan_no, :email,:role,:password,:password_confiramtion, :gender,:bank_id)
	 end
end
