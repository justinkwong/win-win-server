class AddAuthenticationTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string, default: "", index: {uniqe: true}
    #add_index :users, :auth_token, unique: true
  end
end
