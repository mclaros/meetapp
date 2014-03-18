require 'spec_helper'

describe "user creation" do
	let(:user) {User.new}

	context "whitelisting attributes" do
		it "allows mass-assignment of full_name" do
			expect(user).to allow_mass_assignment_of(:full_name)
		end

		it "allows mass-assignment of bio" do
			expect(user).to allow_mass_assignment_of(:bio)
		end

		it "allows mass-assignment of email" do
			expect(user).to allow_mass_assignment_of(:email)
		end

		it "allows mass-assignment of location" do
			expect(user).to allow_mass_assignment_of(:location)
		end

		it "allows mass-assignment of password" do
			expect(user).to allow_mass_assignment_of(:password)
		end
	end

	describe "validations" do
		context "presence" do
			it "validates presence of username" do
				expect(user).to validate_presence_of(:username)
			end

			it "validates presence of full_name" do
				expect(user).to validate_presence_of(:full_name)
			end

			it "validates presence of email" do
				expect(user).to validate_presence_of(:email)
			end

			it "validates presence of session_token" do
				expect(user).to validate_presence_of(:session_token)
			end

			it "validates presence of password_digest with proper message" do
				expect(user).to validate_presence_of(:password_digest).with_message("Password can't be blank")
			end
		end

		# context "uniqueness" do
		# 	it "validates uniqueness of username" do
		# 		user1 = FactoryGirl.build(:user, username: 'bob', password: '123456')
		# 		expect(user1).to validate_uniqueness_of(:username)
		# 	end

		# 	it "validates uniqueness of email" do
		# 		user1 = FactoryGirl.build(:user, :email => "first@example.com", password: "123456")
		# 		expect(user1).to validate_uniqueness_of(:email)
		# 	end
		# end

		context "length" do
			it "validates length of username, between 2..15" do
				expect(user).to ensure_length_of(:username).is_at_least(2).is_at_most(15)
			end

			it "validates length of full_name, max 20" do
				expect(user).to ensure_length_of(:full_name).is_at_most(20)
			end

			it "validates length of bio, max 500" do
				expect(user).to ensure_length_of(:bio).is_at_most(500)
			end

			it "validates length of password when given, min 6" do
				expect(user).to ensure_length_of(:password).is_at_least(6)
			end

			it "validates length of location, max 200" do
				expect(user).to ensure_length_of(:location).is_at_most(200)
			end
		end
	end

end

describe "user lookup" do
	it "identifies correct password" do
		user1 = FactoryGirl.create(:user, password: "123456")
		expect(user1.is_password?("123456")).to be_true
	end

	it "identifies incorrect password" do
		user2 = FactoryGirl.create(:user, password: "123456")
		expect(user2.is_password?("234567")).to be_false
	end

	it "reset_session_token! resets session token" do
		user3 = FactoryGirl.create(:user, password: "123456")
		prior_token = user3.session_token
		user3.reset_session_token!
		new_token = user3.session_token
		expect(prior_token).to_not eq(new_token)
	end

	it "finds user by credentials" do
		user4 = FactoryGirl.create(:user, password: "123456")
		username = user4.username
		expect(User.find_by_credentials(username, "123456")).to eq(user4)
	end

	it "returns nil if username is wrong" do
		user5 = FactoryGirl.create(:user, password: "123456")
		expect(User.find_by_credentials("not_username", "123456")).to be_nil
	end

	it "returns nil if password is wrong" do
		user6 = FactoryGirl.create(:user, password: "123456")
		username = user6.username
		expect(User.find_by_credentials(username, "234567")).to be_nil
	end
end