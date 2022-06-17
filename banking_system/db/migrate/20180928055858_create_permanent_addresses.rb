class CreatePermanentAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :permanent_addresses do |t|
    	t.string :house_name
    	t.string :street_no
    	t.string :area
    	t.string :city
    	t.string :state
    	t.string :country
    	t.integer :pin_code
    	t.string  :address_proof 
      t.integer :user_id
      t.timestamps
    end
  end
end
