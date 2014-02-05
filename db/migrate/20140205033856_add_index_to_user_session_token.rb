class AddIndexToUserSessionToken < ActiveRecord::Migration
  def change
  	change_column :users, :session_token, :string, :null => false
  	add_index :users, :session_token, :unique => true
  end
end
