json.customers @customers do |customer|
	json.id customer.id
	json.first_name customer.first_name
	json.last_name customer.last_name
	json.email customer.user.email
end