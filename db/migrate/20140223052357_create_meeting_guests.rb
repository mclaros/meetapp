class CreateMeetingGuests < ActiveRecord::Migration
  def change
    create_table :meeting_guests do |t|
      t.integer :user_id, :null => false
      t.integer :meeting_id, :null => false
      t.string :status, :null => false

      t.timestamps
    end

    add_index :meeting_guests, [:user_id, :meeting_id], :unique => true
  end
end
