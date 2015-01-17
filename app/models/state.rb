class State < ActiveRecord::Base

	has_many :clients
	
	def self.for_select
		State.all.map{|c| [c.name, c.id]}
	end

end
