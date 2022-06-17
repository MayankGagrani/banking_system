class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  after_initialize do
    build_local_address if new_record? && local_address.blank?
    build_permanent_address if new_record? && permanent_address.blank?
    build_bank if new_record? && bank.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:timeoutable

  validates :role, :pan_no, presence: true

  validates :aadhar_no, length: {is: 12}, numericality: { only_integer: true }
  validates :mobile_number, length: {is: 10}

  belongs_to :bank 
  has_one :local_address, dependent: :destroy
  has_one :permanent_address, dependent: :destroy
  has_one :account, dependent: :destroy
  has_many :images, :as => :imagable


  accepts_nested_attributes_for :local_address
  accepts_nested_attributes_for :permanent_address

  after_create do
    self.build_account(accnt_number: Account.accnt_number, balance: 0.00).save!
  end
end
