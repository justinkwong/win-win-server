class CustomersController < ApplicationController

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.create(customer_params)
		if @customer.save
			redirect_to root_path, notice: "Successfully Created Profile"
		else
			render 'new'
		end
	end

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.save
			redirect_to root_path, notice: "Successfully updated profile"
		else
			render 'edit'
		end
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to root_path, notice: "Customer Profile Deleted"
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
	
end
