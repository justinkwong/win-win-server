class CreateMultipleChoices < ActiveRecord::Migration
  def change
    create_table :multiple_choices do |t|
    	t.string :choice1
    	t.string :choice2
    	t.string :choice3
    	t.string :choice4
    	t.string :choice5
    	t.references :question, index: true

      	t.timestamps
    end
  end
end
