class AddPointsToCustomer < ActiveRecord::Migration
  	def change
  		add_column :customers, :points, :integer, default: 0
  	end
end
