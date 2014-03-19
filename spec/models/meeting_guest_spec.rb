require 'spec_helper'

describe "MeetingGuest creation" do
  let(:meeting_guest) { FactoryGirl.build(:meeting_guest) }

  context "whitelisted attributes" do
  	it "allows mass assignment of status" do
  		expect(meeting_guest).to allow_mass_assignment_of(:status)
  	end

  	it "allows mass assignment of rsvp_comment" do
  		expect(meeting_guest).to allow_mass_assignment_of(:rsvp_comment)
  	end

  	it "does not allow mass assignment of meeting_id" do
  		expect(meeting_guest).to_not allow_mass_assignment_of(:meeting_id)
  	end

  	it "does not allow mass assignment of user_id" do
  		expect(meeting_guest).to_not allow_mass_assignment_of(:user_id)
  	end
  end

  describe "validations" do
  	context "presence" do
  		it "validates presence of meeting_id" do
  			expect(meeting_guest).to validate_presence_of(:meeting_id)
  		end

  		it "validates presence of user_id" do
  			expect(meeting_guest).to validate_presence_of(:user_id)
  		end

  		it "validates presence of status" do
  			expect(meeting_guest).to validate_presence_of(:status)
  		end
  	end

  	context "length" do
  		it "validates length of rsvp_comment, max 200" do
  			expect(meeting_guest).to ensure_length_of(:rsvp_comment).is_at_most(200)
  		end
  	end

  	context "inclusion" do
  		it "validates inclusion of status: ATTENDING, NOT ATTENDING" do
  			expect(meeting_guest).to ensure_inclusion_of(:status).in_array(["ATTENDING", "NOT ATTENDING"])
  		end
  	end
  end
end
