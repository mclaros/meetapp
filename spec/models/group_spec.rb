require 'spec_helper'

describe "group creation" do
	let(:group) {FactoryGirl.build(:group)}
	
	context "whitelisted attributes" do
		it "allows mass assignment of name" do
			expect(group).to allow_mass_assignment_of(:name)
		end

		it "allows mass assignment of description" do
			expect(group).to allow_mass_assignment_of(:description)
		end

		it "allows mass assignment of demonym" do
			expect(group).to allow_mass_assignment_of(:demonym)
		end

		it "allows mass assignment of tags" do
			expect(group).to allow_mass_assignment_of(:tags)
		end

		it "does not allow mass assignment of founder_id" do
			expect(group).to_not allow_mass_assignment_of(:founder_id)
		end
	end

	describe "validations" do
		context "presence" do
			it "validates presence of name" do
				expect(group).to validate_presence_of(:name)
			end

			it "validates presence of description" do
				expect(group).to validate_presence_of(:description)
			end

			it "validates presence of founder_id" do
				expect(group).to validate_presence_of(:founder_id)
			end

			it "validates presence of demonym" do
				expect(group).to validate_presence_of(:demonym)
			end

			it "does not validate presence of tags" do
				expect(group).to_not validate_presence_of(:tags)
			end
		end

		context "length" do
			it "validates length of name, within 2..50" do
				expect(group).to ensure_length_of(:name).is_at_least(2).is_at_most(50)
			end

			it "validates length of demonym, max 10" do
				expect(group).to ensure_length_of(:demonym).is_at_most(10)
			end

			it "validates length of description, max 500" do
				expect(group).to ensure_length_of(:description).is_at_most(500)
			end
		end
	end
end