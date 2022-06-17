class UserMailer < ApplicationMailer

	def send_account_create_email(accnt_id)
		@user = Account.find(accnt_id).user
		mail(from: "no-reply@example.com", to: @user.email, subject: "account regrding message")
	end

	def send_account_verify_confirmation(user)
		@user =  user
		mail(from: "no-reply@example.com", to: @user.email, subject: "Account Verification ")
		
	end

	def deposit_amount_detail_mail(accnt_transaction)
		@accnt_transaction = accnt_transaction
		@user = accnt_transaction,account.user
		mail(from: "no-reply@example.com", to: @user.email, subject: "Transaction detail")
	end

	def send_email_for_add_beneficiery_account(account)
		@account = account
		@user = @account.user
		binding.pry
		mail(from: "no-reply@example.com", to: @user.email, subject: "Beneficiary 
			account add successfully")
	end

end
