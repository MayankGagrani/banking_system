class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
    	t.integer :accnt_number, limit: 8
    	t.float   :balance
    	t.integer :user_id
    	t.boolean :verify
    	t.string  :verified_by
      t.timestamps
    end
  end
end
