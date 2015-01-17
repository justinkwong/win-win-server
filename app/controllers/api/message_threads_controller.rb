module Api 
	class MessageThreadsController < Api::BaseController

		#override show
		def show
			@message_thread = MessageThread.find(params[:id])
			@messages = @message_thread.messages
		end

		private 

		def message_thread_params
			params.require(:message_thread).permit(:client_id, :customer_id)
		end

		def query_params
			params.permit(:message_id, :client_id, :customer_id)
		end
	end
end