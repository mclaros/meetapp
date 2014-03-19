class AddRsvpCommentToMeetingGuests < ActiveRecord::Migration
  def change
    add_column :meeting_guests, :rsvp_comment, :string, :limit => 200
  end
end
