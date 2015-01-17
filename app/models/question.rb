class Question < ActiveRecord::Base

	#DB RELATIONS
	belongs_to :survey
	has_one :multiple_choice
	has_many :question_responses

	accepts_nested_attributes_for :multiple_choice

end
