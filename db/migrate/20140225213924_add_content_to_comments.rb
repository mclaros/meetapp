class AddContentToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :content, :string, :null => false
  end
end
