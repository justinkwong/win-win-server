class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
    	t.references :client, index: true
    	t.references :customer, index: true
      	t.timestamps
    end
  end
end
