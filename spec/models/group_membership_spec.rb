require 'spec_helper'

describe "GroupMembership creation" do
	let(:group_membership) { FactoryGirl.build(:group_membership) }

  context "whitelisted attributes" do
  	it "allows mass assignment of join_comment" do
  		expect(group_membership).to allow_mass_assignment_of(:join_comment)
  	end

  	it "does not allow mass assignment of group_id" do
  		expect(group_membership).to_not allow_mass_assignment_of(:group_id)
  	end

  	it "does not allow mass assignment of user_id" do
  		expect(group_membership).to_not allow_mass_assignment_of(:user_id)
  	end
  end

  describe "validations" do
  	context "presence" do
  		it "validates presence of group_id" do
  			expect(group_membership).to validate_presence_of(:group_id)
  		end

  		it "validates presence of user_id" do
  			expect(group_membership).to validate_presence_of(:user_id)
  		end
  	end

  	context "length" do
  		it "validates length of join_comment, max 200" do
  			expect(group_membership).to ensure_length_of(:join_comment).is_at_most(200)
  		end
  	end
  end
end