class AccountTransactionsController < ApplicationController
before_filter :authenticate_user!
before_action :get_account, only: [:new, :create, :check_balance]
before_action :check_balance, only: [:create]

	def index
		@user = current_user
		@account = @user.account
		@accnt_transactions = @account.account_transactions.last(10) 
	end
	
	def new
		# @account = Account.find(params[:account_id])
		@account_transaction = @account.account_transactions.build
	end

	def create	
		if check_balance
		 @account.balance = @account.balance - params[:account_transaction][:amount].to_f
		 @account_transaction = @account.account_transactions.new(account_transaction_params)
		 @account_transaction.transaction_date = Date.today
		 @account_transaction.withdraw = params[:account_transaction][:amount].to_f
		 if @account_transaction.save && @account.save
		 	modify_account_balance
		 	UserMailer.deposit_amount_detail_mail(@account_transaction).deliver_now
			flash[:error] = "Amount deposit successfully"
	 		redirect_to home_index_path
		 else
			render :new
		 end
		else
			flash[:error] = "You have not sufficient balance to transfer. Please check your account"
			redirect_to home_index_path
		end
	end

	def get_account
		@account = Account.find(params[:account_id]) 
	end

	def check_balance
		@account.balance > params[:account_transaction][:amount].to_f
	end
	

	private
	
	def modify_account_balance
		@account = Account.find_by(accnt_number: params[:account_transaction][:account_to_transfer])
		@account.balance +=  params[:account_transaction][:amount].to_f
		@account_transaction = @account.account_transactions.new(account_transaction_params)
		@account_transaction.transaction_date = Date.today
		@account_transaction.deposit = params[:account_transaction][:amount].to_f
		@account_transaction.save && @account.save			
	end

	def account_transaction_params
		params.require(:account_transaction).permit(:transaction_date,:withdraw,:deposit,:remark,:account_id)
	end
end
