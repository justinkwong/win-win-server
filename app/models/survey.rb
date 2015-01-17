class Survey < ActiveRecord::Base

	#DB RELATIONS
	belongs_to :client
	has_many :questions
	has_many :survey_responses

	#MODEL FUNCTIONS

end
