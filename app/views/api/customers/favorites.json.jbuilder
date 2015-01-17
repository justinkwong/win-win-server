json.favorites @favorites do |fav|
	json.name fav.client.name
	json.rating fav.client.rating
	json.category fav.client.category.name
	json.address1 fav.client.address
	json.city fav.client.city
	json.state fav.client.state.name
end