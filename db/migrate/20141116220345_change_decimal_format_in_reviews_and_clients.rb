class ChangeDecimalFormatInReviewsAndClients < ActiveRecord::Migration
  	def change
  		remove_column :clients, :rating
  		remove_column :reviews, :rating
  		add_column :clients, :rating, :decimal, precision: 2, scale: 1
  		add_column :reviews, :rating, :decimal, precision: 2, scale: 1
  	end
end