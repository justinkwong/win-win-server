json.review do
	json.id @review.id
	json.customer_id @review.customer_id
	json.client_id @review.client_id
	json.rating @review.rating
	json.detail @review.detail
end