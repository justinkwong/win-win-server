class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name, null: false
    	t.string :address, null: false
    	t.string :phone, null: false
    	t.string :menu
    	t.text :description, null: false
    	t.decimal :rating, precision: 1, scale: 1    #error want precision 2, fixed in a later migration
    	t.references :user, index: true

     	t.timestamps
    end
  end
end
