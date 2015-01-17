class Message < ActiveRecord::Base

	belongs_to :message_thread
	

	#User defined functions

	#Star a message
	def mark_star
		self.update_attribute(:star, true)
		#Logic here to give user points, etc
		customer = self.message_thread.customer
		
	end

end
