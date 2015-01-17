class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
    	t.references :survey, index: true
		t.timestamps
    end
  end
end
