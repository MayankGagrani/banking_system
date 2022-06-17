class AccountTransaction < ApplicationRecord
	belongs_to :account 
	validates :amount, presence: true

	attr_accessor :account_to_transfer
	attr_accessor :amount
end
