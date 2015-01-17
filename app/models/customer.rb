class Customer < ActiveRecord::Base

	#relationships
	belongs_to :user
	has_many :reviews
	has_many :favorites
	has_many :message_threads
	has_many :rewards
  	has_many :active_relationships, class_name:  "Relationship",
                                  	foreign_key: "follower_id",
                                  	dependent:   :destroy
    has_many :passive_relationships,class_name:  "Relationship",
                                   	foreign_key: "followed_id",
                                    dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships



	#validations
	validates :first_name, :last_name, presence: true

	accepts_nested_attributes_for :user

	#User Defined Functions

	#Add points to user's tally
	def add_points(points)
		self.update_attribute(:points, (self.points + points))
	end

	#Follow other user
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	#Unfollow other user
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	#Returns true if following other user
	def following?(other_user)
		following.include?(other_user.id)
	end
end
