class CreateAccountTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :account_transactions do |t|
    	t.datetime :transaction_date
    	t.float   :withdraw
    	t.float   :deposit
    	t.string  :remark
    	t.integer :account_id
      t.timestamps
    end
  end
end
