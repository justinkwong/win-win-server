class SurveyResponse < ActiveRecord::Base

	#DB RELATIONS
	belongs_to :survey
	has_many :question_responses

end
