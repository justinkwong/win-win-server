module Api
	class ClientsController < Api::BaseController

		#GET: api/clients/client_id/reviews
		def reviews
			client = Clint.find(params[:client_id])
			@reviews = client.reviews
		end

		#POST: api/clients/client_id/survey_response
		#TODO: define response model
		def survey_response 
			client = Client.find(params[:client_id])
			#TODO: Create survey response instance from params
			#Use model functions to keep controller skinny
			#Survey -> suvery_responses
			#Question -> question_responses
		end

		#GET api/clients/client_id/survey
		def survey
			client = Client.find(params[:client_id])
			@survey = client.get_primary
		end

		#GET api/clients/client_id/favorited
		def favorited 
			client = Client.find(params[:client_id])
			@favorites = client.favorites
		end

		private

		def client_params
			params.require(:client).permit(:name, :address, :address_2, :city, :state, :zip_code, :phone, :menu, :rating, :description,
										   user_attributes: [:id, 
														  :email,
														  :password,
														  :password_confirmation
														]	
														)
		end

		def query_params
			params.permit(:name, :address, :phone, :menu, :rating, :description)
		end

	end
end