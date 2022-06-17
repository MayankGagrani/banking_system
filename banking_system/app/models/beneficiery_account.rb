class BeneficieryAccount < ApplicationRecord
	belongs_to :account

	validates :beneficiery_account_no, :confirm_account_no, numericality: { only_integer: true }, presence: true
end
