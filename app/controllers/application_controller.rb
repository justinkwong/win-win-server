class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	  protect_from_forgery with: :exception

    include Authenticable

    before_action :configure_devise_permitted_parameters, if: :devise_controller?

  	protected

  	#allowing the addition of new parameters to devise login field
  	def configure_devise_permitted_parameters
    	registration_params = [:email, :password, :password_confirmation]
    	if params[:action] == 'create' 
      	devise_parameter_sanitizer.for(:sign_up) { 
        	|u| u.permit(registration_params) 
      	}
    	elsif params[:action] == 'update'
      		devise_parameter_sanitizer.for(:account_update){
        		|u| u.permit(registration_params <<:current_password)
      		}
    	end
  	end

end
