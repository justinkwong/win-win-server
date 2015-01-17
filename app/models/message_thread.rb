class MessageThread < ActiveRecord::Base

	has_many :messages
	belongs_to :customer
	belongs_to :client

end
