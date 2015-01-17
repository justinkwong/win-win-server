class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.decimal :rating, precision: 1, scale: 1
    	t.text :detail
    	t.references :client, index: true
    	t.references :customer, index: true
      	t.timestamps
    end
  end
end
