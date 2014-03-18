class AddDemonymAndTagsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :demonym, :string, :null => false, :default => "member", :limit => 10
    add_column :groups, :tags, :string
  end
end
