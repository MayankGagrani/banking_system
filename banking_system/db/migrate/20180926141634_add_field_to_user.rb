class AddFieldToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :role,:string, default: "user"
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :father_name, :string
  	add_column :users, :mother_name, :string
  	add_column :users, :occupation, :string
  	add_column :users, :father_occupation, :string
  	add_column :users, :mother_occupation, :string
  	add_column :users, :mobile_number, :integer, limit: 8 
  	add_column :users, :aadhar_no, :integer, limit: 8
  	add_column :users, :pan_no, :string
  	add_column :users, :gender, :string
    add_column :users, :bank_id,:integer 
  end
end
