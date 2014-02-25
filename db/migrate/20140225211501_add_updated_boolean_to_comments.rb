class AddUpdatedBooleanToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :updated, :boolean, :null => false, :default => :false
  end
end
