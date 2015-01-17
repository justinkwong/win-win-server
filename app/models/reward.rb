class Reward < ActiveRecord::Base

	belongs_to :customer
	belongs_to :client

	#Return total points obtained
	def total_points 
		return (self.current_points + self.points_redeemed)
	end

	#return a list of rewards for the category
	def get_rewards_for_category(rewards, category)
		list = []
		rewards.each do |reward|
			if reward.category == category
				list << reward
			end
		end
		return list
	end

end
