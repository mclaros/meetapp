# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
  	organizer_id 1
  	name { Faker::Company.catch_phrase }
  	description { Faker::Lorem.paragraph }
  	location do
  		Faker::Company.name + 
	  		", " + Faker::Address.street_address + ", " + 
	  		Faker::Address.secondary_address + ", " +
	  		Faker::Address.city + ", " + Faker::Address.state_abbr
  	end
  	start_date do
  		#some date between 3 days ago and 10 days from now
  		from = Time.now - 3.days
  		to = Time.now + 10.days
  		random_date = from + (to - from)*rand
  		random_date.strftime("%F")
  	end
  	start_time do
  		#some time (hour:minute) between now and tomorrow
  		from = Time.now
  		to = Time.now + 1.day
  		random_time = from + (to - from)*rand
  		random_time.strftime("%R")
  	end
  	time_zone { Faker::Address.time_zone }
  	additional_instructions { Faker::Lorem.paragraph }
  end
end
