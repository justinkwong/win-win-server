class SurveysController < ApplicationController

	before_action :load_client

	def new
		@survey = Survey.new
	end

	def create
		@survey = @client.surveys.create(survey_params)
		if @survey.save 
			redirect_to new_survey_question_path(@survey), notice: "Successfully created survey"
		else
			render 'new'
		end
	end

	private

	def survey_params 
		params.require(:survey).permit(:name, :client_id, :flag)
	end

	def load_client
		@client = Client.find(params[:client_id])
	end
end
