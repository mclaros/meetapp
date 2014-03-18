class RemoveDobFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :date_of_birth
  end
end
