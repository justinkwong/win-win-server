class CreateRewardProfiles < ActiveRecord::Migration
  def change
    create_table :reward_profiles do |t|
    	t.string :name, null: false
    	t.integer :tier, null: false
    	t.integer :points, null: false
    	t.integer :max_redeem, null: false 
    	t.text :redeem_message
    	t.references :client, index: true

	    t.timestamps
    end
  end
end
