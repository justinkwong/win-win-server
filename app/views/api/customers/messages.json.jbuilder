json.threads @message_threads do |thread|
	json.id thread.id
	json.client_id thread.client.name
	json.message_thread_id thread.id
	json.message_body thread.messages.last.body
end