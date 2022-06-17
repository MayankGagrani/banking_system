class Bank < ApplicationRecord
	has_one :user,dependent: :destroy
	has_one :manager, class_name: User

	validates_uniqueness_of :bank_name

end
