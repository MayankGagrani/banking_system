class Account < ApplicationRecord
	belongs_to :user 
	has_many :account_transactions, dependent: :destroy
	has_many :beneficiery_accounts, dependent: :destroy

	after_create :send_email_to_user
		
	def self.accnt_number  
		rand(9999999999).to_s.center(12, rand(9).to_s)
	end

	def send_email_to_user
		UserMailer.send_account_create_email(self.id).deliver_now
	end

end
