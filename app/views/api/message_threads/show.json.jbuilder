json.messages @messages do |message|
	json.id message.id
	json.body message.body
	json.sent_from_customer message.sent_from_customer
end