class CreateRewards < ActiveRecord::Migration
 	def change
    	create_table :rewards do |t|
    		t.integer :current_points, default: 0
    		t.integer :points_redeemed, default: 0
    		t.string :category, null: false
    		t.references :client, index: true
    		t.references :customer, index: true
    		t.timestamps
    	end
  	end
end
