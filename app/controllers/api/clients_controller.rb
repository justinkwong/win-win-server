module Api
	class ClientsController < Api::BaseController

		#GET: api/clients/client_id/reviews
		def reviews
			client = Clint.find(params[:client_id])
			@reviews = client.reviews
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

		#GET: api/clients/client_id/reward_profiles
		def reward_profiles
			client = Client.find(params[:client_id])
			@rewards = client.reward_profiles
		end

		#POST: api/clients/client_id/survey_response
		def survey_response 
			client = Client.find(params[:client_id])
			#TODO: Create survey response instance from params
			#Use model functions to keep controller skinny
			#Survey -> suvery_responses
			#Question -> question_responses
		end

		#POST: api/clients/client_id/new_reward
		def new_reward
			client = Client.find(params[:client_id])
			if client.reward_profiles.create(rewards_params)
				render json: client.reward_profiles, status: 201
			else
				render json: {errors: "invalid parameters"}, status: 403
			end
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

		def rewards_params
			params.require(:reward).permit(:name, :tier, :points, :max_redeem, :redeem_message)
		end

		def query_params
			params.permit(:name, :address, :phone, :menu, :rating, :description)
		end

	end
end