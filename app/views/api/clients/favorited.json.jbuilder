json.favorited @favorites do |fav|
	json.first_name	fav.customer.first_name
	json.last_name fav.customer.last_name
end