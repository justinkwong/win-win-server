class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.references :client, index: true
    	t.references :customer, index: true
	    t.timestamps
    end
  end
end
