json.reviews @reviews do |review|
	json.id review.id
	json.customer_id review.customer_id
	json.client_id review.client_id
	json.detail review.detail
	json.rating review.rating
end