class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :category, null: false
    	t.string :prompt, null: false
    	t.references :survey, index: true

      	t.timestamps
    end
  end
end
