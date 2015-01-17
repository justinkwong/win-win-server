class AddStarToComments < ActiveRecord::Migration
  	def change
  		remove_column :reviews, :rating, :decimal
  		add_column :reviews, :rating, :decimal, precision: 2, scale: 1, null: false
  		add_column :messages, :star, :boolean, default: false
  		add_column :reviews, :upvotes, :integer, default: 0
  	end
end