class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.string :location, :null => true
      t.integer :organizer_id, :null => false
      t.integer :group_id, :null => true

      t.timestamps
    end

    add_index :meetings, :organizer_id
    add_index :meetings, :group_id
  end
end
