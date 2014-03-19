class AddJoinCommentToGroupMemberships < ActiveRecord::Migration
  def change
    add_column :group_memberships, :join_comment, :string, :limit => 200
  end
end
