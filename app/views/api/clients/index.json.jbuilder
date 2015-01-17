json.clients @clients do |client|
	json.id client.id
	json.name client.name
	json.address client.address
	json.phone client.phone
	json.menu client.menu
	json.rating client.rating
	json.description client.description
end