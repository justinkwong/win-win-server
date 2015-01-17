class Category < ActiveRecord::Base

	has_one :client

	def self.for_select
		Category.all.map{|c| [c.name, c.id]}
	end
end
