class AddStartEndDateTimeSugestedDonationPastTimezoneLocationInstructionsToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :start_date, :date, :null => false
    add_column :meetings, :start_time, :time, :null => false
    add_column :meetings, :end_date, :date
    add_column :meetings, :end_time, :time
    add_column :meetings, :suggested_donation, :real
    add_column :meetings, :is_past, :boolean, :null => false, :default => false
    add_column :meetings, :time_zone, :string, :null => false, :default => "Pacific Time (US & Canada)"
    add_column :meetings, :additional_instructions, :string, :limit => 200
    add_column :meetings, :is_private, :boolean, :null => false, :default => false

    change_column :meetings, :location, :string, :null => false, :limit => 200
    add_index :meetings, [:start_date, :start_time]
  end
end
