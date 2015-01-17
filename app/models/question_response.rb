class QuestionResponse < ActiveRecord::Base

	#DB RELATIONS
	belongs_to :survey_response
	belongs_to :question

	#VALIDATIONS
	validates :response, presence: true
end
