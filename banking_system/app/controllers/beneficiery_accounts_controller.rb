class BeneficieryAccountsController < ApplicationController
	before_action :set_account , only: [:new, :create, :index, :check_account_add]
	
	def index
		@beneficiery_accounts = BeneficieryAccount.all
		@account_transaction = @account.account_transactions.new
	end

	def new
		@beneficiery_account = @account.beneficiery_accounts.new
	end

	def create
		@beneficiery_account = @account.beneficiery_accounts.new(beneficiery_account_params)	
		unless check_account_add	
			if check_account.present?
				if @beneficiery_account.save
					UserMailer.send_email_for_add_beneficiery_account(@account)
					flash[:error] = "Account added successfully"
					redirect_to account_account_transactions_path
				end
			else
				flash[:error] = "This Account does not exist, Please check."
			end
		else 
			flash[:notice] = "Account already present in list"
			redirect_to home_index_path
		end

	end

	# def check_account_no
	# end
	
	private

		def set_account
		@account =	Account.find(params[:account_id])
		end

		def check_account
			Account.find_by(accnt_number: params[:beneficiery_account][:beneficiery_account_no])
		end

		def check_account_add
			@account.beneficiery_accounts.where(beneficiery_account_no: params[:beneficiery_account][:beneficiery_account_no]).present?

		end

		def beneficiery_account_params
			params.require(:beneficiery_account).permit(:beneficiery_account_no, :confirm_account_no, :account_id)
		end
end
