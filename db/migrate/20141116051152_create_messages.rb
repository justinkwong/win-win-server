class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.text :body, null: false
    	t.references :message_thread, index: true
      	t.timestamps
    end
  end
end
