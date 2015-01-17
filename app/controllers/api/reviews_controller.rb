module Api
	class ReviewsController < Api::BaseController

		#override create and set rating for client
		#might not need this at all if reviews are only from surveys
		def create
			super
			client = Client.find(params[:review][:client_id])
			client.set_rating
		end

		#upvote a review
		#TODO: figure out how to prevent user from upvoting more than once
		def upvote
			@review = Review.find(params[:review_id])
			@review.update_attribute(:upvotes, (@review.upvotes + 1))
		end

		private 

		def review_params
			params.require(:review).permit(:client_id, :customer_id, :rating, :detail)
		end

		def query_params
			params.permit(:client_id, :customer_id, :rating, :detail)
		end
	end
end