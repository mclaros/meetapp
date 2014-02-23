class AddRestrictionsToGroups < ActiveRecord::Migration
  def change
  	change_column :groups, :name, :string, :null => false
  	change_column :groups, :description, :string, :null => false
  	change_column :groups, :founder_id, :integer, :null => false
  	add_index :groups, :founder_id
  end
end
