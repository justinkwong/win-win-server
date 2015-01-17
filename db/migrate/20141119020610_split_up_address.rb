class SplitUpAddress < ActiveRecord::Migration
 	def change
  		add_column :clients, :address_2, :string
  		add_column :clients, :city, :string, null: false
  		add_column :clients, :zip_code, :string, null: false
  		add_reference :clients, :state, index: true

  		add_column :messages, :sent_from_customer, :boolean, null: false
  	end
end
