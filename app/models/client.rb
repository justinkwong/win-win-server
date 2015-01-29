class Client < ActiveRecord::Base

	#relations
	belongs_to :user
	belongs_to :category
	belongs_to :state
	has_many :reviews
	has_many :message_threads
	has_many :surveys
	has_many :favorites

	accepts_nested_attributes_for :user

	#validations
	validates :name, :address, :phone, :description, presence: true

	#set the rating for a client
	def set_rating
		self.update_attribute(:rating, get_rating)
	end

	#helper method to calculate rating based on reviews
	def get_rating
		num = self.reviews.count
		if num > 0
			total = 0
			self.reviews.each do |review|
				total += review.rating
			end
			return (total / num)
		else
			return nil
		end	
	end

	#Marks current survey as primary and turns all other off
	def mark_primary(survey)
		survey.update_attribute(flag: true)
		self.surveys.each do |s|
			if s.flag && s != survey
				s.update_attribute(flag: false)
			end
		end
	end

	#returns the survey that's marked as primary
	def get_primary
		self.surveys.each do |s|
			if s.flag
				return s
			end
		end
	end

	#return the max number of questions that a client is allowed to have for a survey
	def max_questions
		#Add to DB probably- maybe have different levels of membership?
		#Default to return 2
		return 2
	end

end