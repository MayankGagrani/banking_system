class CreateBeneficieryAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :beneficiery_accounts do |t|
    	t.integer :account_id
    	t.integer :beneficiery_account_no, limit: 8
    	t.integer	:confirm_account_no,limit: 8
      t.timestamps
    end
  end
end
