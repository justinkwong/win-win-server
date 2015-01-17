json.threads @message_threads do |thread|
	json.id thread.id
	json.client_id thread.client_id
	json.customer_id thread.customer_id
	json.last_message_body thread.messages.last.body
end