class ClientsController < ApplicationController

	before_action :load_client, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:messages, :favorites]
	before_action :authenticate_with_token!, only: [:update, :destroy]

	def new
		@client = Client.new
	end

	def create
		@client = Client.create(client_params)
		if @client.save 
			redirect_to root_path, notice: 'Successfully created profile'
		else
			render 'new'
		end
	end

	def index
		@client = Clinet.all
	end

	def show
	end

	def edit
	end

	def update
		@client = current_user.client
		
		if @client.save
			redirect_to action: :show, id: @client.id 
		else
			render 'edit'
		end
	end

	def destroy
		@client.destroy
		redirect_to root_path, notice: "Company profile deleted"
	end

	#only show when user is logged in
	def favorite
		client = Client.find(params[:client_id])
		favorite = Favorite.new(client_id: params[:client_id])
		current_user.customer.favorites ||= []
		current_user.customer.favorites << favorite
		redirect_to root_path, notice: "Company added to favorites"
	end

	#view all messages
	def messages
		@client = Client.find(params[:client_id])
		@threads = @client.message_threads
	end

	private

	def load_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(:name, :address, :address_2, :city, :state_id, :zip_code, :phone, :category_id, :description,
										user_attributes: [:id,
														  :email,
														  :password,
														  :password_confirmation
														]					
										)
	end
end
