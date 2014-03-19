require 'spec_helper'

describe "meeting creation" do
	let(:meeting) { FactoryGirl.build(:meeting) }

	context "whitelisted attributes" do
		it "allows mass assignment of name" do
			expect(meeting).to allow_mass_assignment_of(:name)
		end

		it "allows mass assignment of description" do
			expect(meeting).to allow_mass_assignment_of(:description)
		end

		it "allows mass assignment of location" do
			expect(meeting).to allow_mass_assignment_of(:location)
		end

		it "allows mass assignment of start_date" do
			expect(meeting).to allow_mass_assignment_of(:start_date)
		end

		it "allows mass assignment of start_time" do
			expect(meeting).to allow_mass_assignment_of(:start_time)
		end

		it "allows mass assignment of end_date" do
			expect(meeting).to allow_mass_assignment_of(:end_date)
		end

		it "allows mass assignment of end_time" do
			expect(meeting).to allow_mass_assignment_of(:end_time)
		end

		it "allows mass assignment of time_zone" do
			expect(meeting).to allow_mass_assignment_of(:time_zone)
		end

		it "allows mass assignment of suggested_donation" do
			expect(meeting).to allow_mass_assignment_of(:suggested_donation)
		end

		it "allows mass assignment of is_past" do
			expect(meeting).to allow_mass_assignment_of(:is_past)
		end

		it "allows mass assignment of is_private" do
			expect(meeting).to allow_mass_assignment_of(:is_private)
		end

		it "allows mass assignment of additional_instructions" do
			expect(meeting).to allow_mass_assignment_of(:additional_instructions)
		end

		it "does not allow mass assignment of organizer_id" do
			expect(meeting).to_not allow_mass_assignment_of(:organizer_id)
		end

		it "does not allow mass assignment of group_id" do
			expect(meeting).to_not allow_mass_assignment_of(:group_id)
		end
	end

	describe "validations" do
		context "presence" do
			it "validates presence of organizer_id" do
				expect(meeting).to validate_presence_of(:organizer_id)
			end

			it "validates presence of name" do
				expect(meeting).to validate_presence_of(:name)
			end

			it "validates presence of description" do
				expect(meeting).to validate_presence_of(:description)
			end

			it "validates presence of location" do
				expect(meeting).to validate_presence_of(:location)
			end

			it "validates presence of start_date" do
				expect(meeting).to validate_presence_of(:start_date)
			end

			it "validates presence of start_time" do
				expect(meeting).to validate_presence_of(:start_time)
			end

			it "validates presence of time_zone" do
				expect(meeting).to validate_presence_of(:time_zone)
			end
		end

		context "length" do
			it "validates length of name, max 50" do
				expect(meeting).to ensure_length_of(:name).is_at_most(50)
			end

			it "validates length of description, max 500" do
				expect(meeting).to ensure_length_of(:description).is_at_most(500)
			end

			it "validates length of location, max 200" do
				expect(meeting).to ensure_length_of(:location).is_at_most(200)
			end

			it "validates length of additional_instructions, max 200" do
				expect(meeting).to ensure_length_of(:additional_instructions).is_at_most(200)
			end
		end

	end

end