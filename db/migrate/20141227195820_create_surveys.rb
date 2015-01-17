class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
    	t.string :name
    	t.boolean :flag, null: false
    	t.references :client, index: true
      	t.timestamps
    end
  end
end
