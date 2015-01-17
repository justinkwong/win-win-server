class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
    	t.string :response, null: false
    	t.references :question, index: true
    	t.references :survey_response, index: true

      	t.timestamps
    end
  end
end
