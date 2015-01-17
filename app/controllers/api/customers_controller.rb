module Api
	class CustomersController < Api::BaseController

		def create
			customer = Customer.create(customer_params)
			#TODO: LOG USER IN AFTER SUCCESSFUL ACCOUNT CREATION
			if customer.save
				render json: customer, status: 201
			else 
				render json: {error: "Could not create account"}, status: 403
			end

		end

		#GET: api/customers/customer_id/messages
		#Returns the threads and most recent message to preview
		#TODO CHANGE THE RESPONSE JSON
		def messages
			customer = Customer.find(params[:customer_id])
			@message_threads = customer.message_threads
		end

		#GET: api/customers/customer_id/favorites
		#Returns all favorites for user
		#TODO JSON response
		def favorites 
			customer = Customer.find(params[:customer_id])
			@favorites = customer.favorites
		end

		#GET: api/customers/customer_id/rewards
		#Returns all rewards for a category
		def rewards
			customer = Customer.find([:customer_id])
			@rewards = Reward.get_reward_for_category(customer.rewards, params[:customer][:reward_category])
		end

		#POST: api/customers/customer_id/new_message
		def new_message
			customer = Customer.find(params[:customer_id])
			#TODO: create message object here
			#check for thread, if it doesn't exist
			#must create a new one, if it does then just
			#add message to thread
		end

		#POST: api/customers/customr_id/favorite
		#Add a company to favorite list
		#TODO JSON repsonse
		#DONT THINK WE NEED THIS- no direct api call to favorite
		def favorite
			customer = Customer.find(params[:customer_id])
			client = Client.find(params[:favorite][:client_id])
			favorite = Favorite.create()	#PARAMS
			favorite.client = cleient
			customer.favorites << favorite
		end

		#POST: api/customers/customer_id/follow
		#TODO JSON response: maybe
		def follow
			customer = Customer.find(params[:customer_id])
			if customer.follow(Customer.find(params[:other_customer_id]))
				render json: customer.active_relationships, status: 204
			else
				render json: {error: "Sorry could not find user to follow"}, status: 403
			end
		end

		#DELETE: api/customers/customer_id/remove_favorite
		#Remove company from favorite list
		def remove_favorite
			customer = Customer.find(params[:remove_favorite][:customer_id])
			#Need a way to get favorite_id or just send it with params?
			customer.favorites.destroy(params[:favorite_id])
		end

		private

		def customer_params
			params.require(:customer).permit(:first_name, :last_name,
											user_attributes: [:id, 
														  	  :email,
														  	  :password,
														  	  :password_confirmation
															]	
															)
		end

		def query_params
			params.permit(:id, :first_name, :last_name)
		end
	end
end