class QuestionsController < ApplicationController

	before_action :load_survey

	def new
		@question = Question.new
	end

	def create
		@question = @survey.questions.create(question_params)
		#if category is not multiple choice then delete multiple choice object 
		if question_params[:category] != "multiple choice"
			@question.multiple_choice.delete
		end
		if @question.save
			if @survey.questions.count <= @survey.client.max_questions
				redirect_to new_survey_question_path(@survey), notice: "Add another question"
			else
				redirect_to client_path(@survey.client)
			end
		else
			render 'new'
		end
	end

	private

	def load_survey 
		@survey = Survey.find(params[:survey_id])
	end

	def question_params
		params.require(:question).permit(:prompt, :category,
										 multiple_choice_attributes: [:choice1, :choice2, :choice3, :choice4, :choice5])
	end
end
