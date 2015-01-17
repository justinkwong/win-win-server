class Favorite < ActiveRecord::Base

	belongs_to :client
	belongs_to :customer #do we need this? probably not, leave here for now

end
