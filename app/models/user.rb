class User < ActiveRecord::Base

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    before_create :generate_authentication_token!

    #relations for rails magic
	has_one :client
	has_one :customer

	#validations
	validates :email, presence: true
	#validates :auth_token, uniqueness: true

	#user defined functions

	def generate_authentication_token!
		begin
			self.auth_token = Devise.friendly_token
		end while self.class.exists?(auth_token: auth_token)
	end

end