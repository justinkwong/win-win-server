json.rewards @rewards do |reward|
	json.id reward.id
	json.current_points reward.current_points
	json.points_redeemed reward.points_redeemed
	json.client_id reward.client_id
end